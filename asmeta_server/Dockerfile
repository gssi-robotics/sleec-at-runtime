FROM eclipse-temurin:17-jre

WORKDIR /asmeta_server

COPY . /asmeta_server

RUN mkdir -p /asmeta_server/src/main/resources/models
RUN mkdir -p /asmeta_server/src/main/resources/libraries

ENTRYPOINT ["java", "-jar", "AsmetaServer.jar"]