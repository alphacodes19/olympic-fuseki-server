#!/bin/sh

echo "Starting Fuseki..."

./fuseki-server \
  --file=/data/olympics-data.ttl \
  /olympics
