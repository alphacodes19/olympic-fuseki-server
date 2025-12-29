FROM eclipse-temurin:11-jre-jammy

ENV FUSEKI_VERSION=4.10.0

WORKDIR /fuseki

RUN apt-get update && apt-get install -y wget unzip \
    && wget https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-${FUSEKI_VERSION}.zip \
    && unzip apache-jena-fuseki-${FUSEKI_VERSION}.zip \
    && mv apache-jena-fuseki-${FUSEKI_VERSION}/* . \
    && rm -rf apache-jena-fuseki-${FUSEKI_VERSION} apache-jena-fuseki-${FUSEKI_VERSION}.zip

COPY olympics-data.ttl /data/olympics-data.ttl
COPY start-fuseki.sh /start-fuseki.sh

RUN chmod +x /start-fuseki.sh

EXPOSE 10000

CMD ["/start-fuseki.sh"]
