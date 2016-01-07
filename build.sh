#!/bin/bash

. settings.sh

for SCALA_VERSION in ${SCALA_VERSIONS}; do
    echo "Building confluent-platform-${SCALA_VERSION}"
    cp confluent-platform/Dockerfile confluent-platform/Dockerfile.${SCALA_VERSION}
    sed -i "s/ENV SCALA_VERSION=.*/ENV SCALA_VERSION=\"${SCALA_VERSION}\"/" confluent-platform/Dockerfile.${SCALA_VERSION}
    TAGS="fredcons/confluent-platform-${SCALA_VERSION}"
    if [ "x$SCALA_VERSION" = "x$DEFAULT_SCALA_VERSION" ]; then
	TAGS="$TAGS fredcons/confluent-platform"
    fi
    for TAG in ${TAGS}; do
	docker build -t $TAG -f confluent-platform/Dockerfile.${SCALA_VERSION} confluent-platform/
    done
done

docker build -t fredcons/confluent-zookeeper zookeeper/
docker build -t fredcons/confluent-kafka kafka/
docker build -t fredcons/confluent-schema-registry schema-registry/
docker build -t fredcons/confluent-rest-proxy rest-proxy/
docker build -t fredcons/confluent-tools tools/

