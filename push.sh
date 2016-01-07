#!/bin/bash

. settings.sh

for SCALA_VERSION in ${SCALA_VERSIONS}; do
    docker push fredcons/confluent-platform-${SCALA_VERSION}
done
docker push fredcons/confluent-platform

docker push fredcons/zookeeper
docker push fredcons/kafka
docker push fredcons/schema-registry
docker push fredcons/rest-proxy
docker push fredcons/tools
