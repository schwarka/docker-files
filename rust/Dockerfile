FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl \
    && curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --disable-sudo -y \
    && apt-get remove --purge -y curl \
    && apt-get autoclean \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /source

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
