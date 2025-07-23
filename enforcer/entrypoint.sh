#!/bin/bash

SERVER_IP=${SERVER_IP:-localhost}
RABBITMQ_HOST=${RABBITMQ_HOST:-localhost}

sed -e "s/\${SERVER_IP}/$SERVER_IP/g" -e "s/\${RABBITMQ_HOST}/$RABBITMQ_HOST/g" ./config.template.json > ./enforcer/config.json

RETRIES=30
until curl -s "http://$SERVER_IP:8080" > /dev/null; do
  echo "Asmeta Server is not available yet... waiting..." >&1
  RETRIES=$((RETRIES - 1))
  if [ $RETRIES -le 0 ]; then
    echo "ERROR: Timeout waiting for Asmeta Server: exting." >&1
    exit 1
  fi
  sleep 1
done

echo "Asmeta Server is now ready! Running the enforcer python module" >&1

cd ./enforcer
exec python3 main.py