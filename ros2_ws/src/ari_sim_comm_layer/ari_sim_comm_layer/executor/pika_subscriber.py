import asyncio
import aio_pika
import json
from threading import Thread
from typing import Callable, Optional, Awaitable, Union


class PikaSubscriber:
    def __init__(
        self,
        host: str,
        port: int,
        queue: str,
        on_message: Callable[[bytes], Union[None, Awaitable[None]]],
        *,
        prefetch: int = 10,
        auto_ack: bool = False,
        requeue_on_error: bool = False,
    ):
        self.host = host
        self.port = port
        self.queue_name = queue
        self.on_message = on_message
        self.prefetch = prefetch
        self.auto_ack = auto_ack
        self.requeue_on_error = requeue_on_error

        self.url = f"amqp://guest:guest@{host}:{port}/"
        self.loop = asyncio.new_event_loop()
        self._ready = asyncio.Event()
        self._stopping = asyncio.Event()

        def run_loop(loop):
            asyncio.set_event_loop(loop)
            loop.run_until_complete(self._connect_and_consume())
            loop.run_forever()

        self.thread = Thread(target=run_loop, args=(self.loop,), daemon=True)
        self.thread.start()

    async def _connect_and_consume(self):
        backoff = 1
        while not self._stopping.is_set():
            try:
                self.conn = await aio_pika.connect_robust(self.url)
                self.channel = await self.conn.channel()
                await self.channel.set_qos(prefetch_count=self.prefetch)

                self.queue = await self.channel.declare_queue(self.queue_name, durable=True)

                await self.queue.consume(self._on_msg, no_ack=self.auto_ack)
                self._ready.set()
                print(f"[RabbitMQ] subscriber connected, consuming '{self.queue_name}'")
                return
            except Exception as e:
                print(f"[RabbitMQ] subscriber connect failed: {e}. retrying in {backoff}s")
                await asyncio.sleep(backoff)
                backoff = min(backoff * 2, 30)

    async def _on_msg(self, message: aio_pika.IncomingMessage):
        if self.auto_ack:
            # No manual ack/nack path
            await self._dispatch(message.body)
            return

        try:
            async with message.process(requeue=self.requeue_on_error):
                rec_message = message.body.decode('utf-8')
                print(f"[RabbitMQ] received message: {rec_message}")
                await self._dispatch(message.body)
        except Exception as e:
            # message.process will nack automatically on exception when requeue=True
            print(f"[RabbitMQ] subscriber callback error: {e}")

    async def _dispatch(self, body: bytes):
        # Support sync or async callbacks
        print(f"[RabbitMQ DISP] dispatching message to callback: {body.decode('utf-8')}")
        res = self.on_message(body)
        if asyncio.iscoroutine(res):
            await res

    def close(self):
        async def _close():
            self._stopping.set()
            try:
                await self.conn.close()
            except Exception:
                pass
            self.loop.stop()

        asyncio.run_coroutine_threadsafe(_close(), self.loop)


