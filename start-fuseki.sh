#!/bin/bash
echo "Starting Fuseki on port $PORT"

./fuseki-server \
  --port=$PORT \
  --file=/data/olympics-data.ttl \
  /olympics
