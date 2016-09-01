FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y gcc make check && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /code

VOLUME ["/code"]
WORKDIR /code

CMD 'bash'