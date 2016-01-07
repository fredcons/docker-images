#!/bin/bash

. settings.sh

for SCALA_VERSION in ${SCALA_VERSIONS}; do
    docker push fredcons/confluent-platform-${SCALA_VERSION}
done
docker push fredcons/confluent-platform

docker push fredcons/confluent-zookeeper
docker push fredcons/confluent-kafka
docker push fredcons/confluent-schema-registry
docker push fredcons/confluent-rest-proxy
docker push fredcons/confluent-tools
