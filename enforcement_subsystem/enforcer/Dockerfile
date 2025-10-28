FROM python:3.11-slim

WORKDIR /sleec_enforcer

COPY . /sleec_enforcer

RUN chmod +x /sleec_enforcer/entrypoint.sh && \
    apt update && \
    apt install -y bash curl && \
    pip install --no-cache-dir -r requirements.txt && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sleec_enforcer/entrypoint.sh"]