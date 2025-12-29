#!/bin/bash
echo "Starting Fuseki on port $PORT"

./fuseki-server \
  --port=$PORT \
  --mem /olympics \
  /data/olympics-data.ttl
