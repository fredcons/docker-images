# Builds a base docker image for the Confluent stream platform. It doesn't
# start up any particular service, just installs the platform. Other images
# inherit from this image to start up a particular service.

FROM debian:8.2

ENV SCALA_VERSION="2.10.5"
ENV JAVA_VERSION="7"
ENV CONFLUENT_MAJOR_VERSION="2.0"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl tree vim less openjdk-${JAVA_VERSION}-jre-headless && \
    curl -SL http://packages.confluent.io/deb/${CONFLUENT_MAJOR_VERSION}/archive.key | apt-key add - && \
    echo "deb [arch=amd64] http://packages.confluent.io/deb/${CONFLUENT_MAJOR_VERSION} stable main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y confluent-platform-${SCALA_VERSION}
