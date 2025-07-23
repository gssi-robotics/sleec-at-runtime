import pika
import json

RABBITMQ_HOST = 'localhost'
RABBITMQ_PORT = 5672
QUEUE_NAME = 'obligations'  # Cambia con la tua coda

def callback(ch, method, properties, body):
    print("\n📨 Messaggio ricevuto:")
    print("-" * 30)
    try:
        message = json.loads(body)
        print(json.dumps(message, indent=2))
    except Exception:
        print(body.decode())

    # Per debug: non confermare subito
    input("🔍 Premi INVIO per ACK del messaggio...")
    ch.basic_ack(delivery_tag=method.delivery_tag)

def main():
    connection = pika.BlockingConnection(pika.ConnectionParameters(
        host=RABBITMQ_HOST,
        port=RABBITMQ_PORT
    ))
    channel = connection.channel()

    # Assicurati che la coda esista
    channel.queue_declare(queue=QUEUE_NAME, durable=True)

    print(f"🧭 In ascolto sulla coda '{QUEUE_NAME}' (CTRL+C per uscire)")
    channel.basic_consume(
        queue=QUEUE_NAME,
        on_message_callback=callback,
        auto_ack=False  # ❗ NON auto_ack
    )

    try:
        channel.start_consuming()
    except KeyboardInterrupt:
        print("\n👋 Interrotto da tastiera. Esco...")
        channel.stop_consuming()
        connection.close()

if __name__ == "__main__":
    main()
