FROM openjdk:11-jre-slim

ENV FUSEKI_VERSION=4.10.0
ENV FUSEKI_HOME=/fuseki

WORKDIR /

RUN apt-get update && apt-get install -y curl unzip \
    && curl -L https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-${FUSEKI_VERSION}.zip -o fuseki.zip \
    && unzip fuseki.zip \
    && mv apache-jena-fuseki-${FUSEKI_VERSION} ${FUSEKI_HOME} \
    && rm fuseki.zip

WORKDIR ${FUSEKI_HOME}

COPY olympics-data.ttl /data/olympics-data.ttl
COPY olympic.owl /data/olympic.owl
COPY start-fuseki.sh /start-fuseki.sh

RUN chmod +x /start-fuseki.sh

EXPOSE 3030

CMD ["/start-fuseki.sh"]
