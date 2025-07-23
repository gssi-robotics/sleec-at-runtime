FROM python:3.11-slim

WORKDIR /sleec_enforcer

# COPY ./enforcer /sleec_enforcer/enforcer
# COPY ./requirements.txt /sleec_enforcer/requirements.txt
# COPY ./resources /sleec_enforcer/resources

# COPY ./config.template.json /sleec_enforcer/enforcer/config.template.json
# COPY ./entrypoint.sh /sleec_enforcer/entrypoint.sh
COPY . /sleec_enforcer

RUN chmod +x /sleec_enforcer/entrypoint.sh && \
    apt update && \
    apt install -y bash curl && \
    pip install --no-cache-dir -r requirements.txt && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# ENV SERVER_IP=localhost

ENTRYPOINT ["/sleec_enforcer/entrypoint.sh"]
# ENTRYPOINT ["/bin/bash", "-c", "cd ./enforcer && python3 main.py"]