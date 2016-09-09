FROM ubuntu:latest

ENV SCALA_VERSION=2.11.8
ENV SBT_VERSION 0.13.12

RUN mkdir /code && \
    apt-get update && \
    apt-get install -y curl openjdk-8-jre-headless && \
    \
    echo "===== installing scala =====" && \
    curl -#SL http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb -o scala-$SCALA_VERSION.deb && \
    dpkg -i scala-$SCALA_VERSION.deb && \
    scala -version && \
    \
    echo "===== installing sbt =====" && \
    curl -#SL https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb -o sbt-$SBT_VERSION.deb && \
    dpkg -i sbt-$SBT_VERSION.deb && \
    sbt about && \
    \
    echo "===== cleanup =====" && \
    rm -f *.deb && \
    apt-get remove --auto-remove --purge -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/code"]
WORKDIR /code

CMD 'bash'