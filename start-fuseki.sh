#!/bin/sh

echo "Starting Fuseki..."

./fuseki-server \
  --file=/data/olympics-data.ttl \
  --file=/data/olympic.owl \
  /olympics
