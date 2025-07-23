FROM eclipse-temurin:17-jre

WORKDIR /asmeta_server

COPY . /asmeta_server

RUN apt-get update && \
    apt-get install -y bash python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "-c", "python3 asmeta_runtime_server.py"]