import asyncio
from threading import Thread
import aio_pika

class PikaPublisher:
    def __init__(self, host, port, user, password, queue):
        self.queue = queue
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.url = f"amqp://{user}:{password}@{host}:{port}/"
        self.loop = asyncio.new_event_loop()
        self._ready = asyncio.Event()

        def run_loop(loop):
            asyncio.set_event_loop(loop)
            loop.run_until_complete(self._connect())
            loop.run_forever()

        self.thread = Thread(target=run_loop, args=(self.loop,), daemon=True)
        self.thread.start()

    async def _connect(self):
        backoff = 1
        while True:
            try:
                self.conn = await aio_pika.connect_robust(self.url)
                self.channel = await self.conn.channel()
                await self.channel.set_qos(prefetch_count=10)
                await self.channel.declare_queue(self.queue, durable=True)
                self.exchange = self.channel.default_exchange
                self._ready.set()
                print("[RabbitMQ] connected")
                return
            except Exception as e:
                print(f"[RabbitMQ] connect failed: {e}. retrying in {backoff}s")
                await asyncio.sleep(backoff)
                backoff = min(backoff * 2, 30)

    async def _publish_async(self, payload: str):
        await self._ready.wait()
        await self.exchange.publish(
            aio_pika.Message(
                body=payload.encode("utf-8"),
                delivery_mode=aio_pika.DeliveryMode.PERSISTENT
            ),
            routing_key=self.queue
        )

    def publish(self, payload: str):
        fut = asyncio.run_coroutine_threadsafe(self._publish_async(payload), self.loop)
