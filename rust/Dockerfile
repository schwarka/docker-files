FROM ubuntu:latest

ADD install.sh install.sh
RUN chmod +x install.sh && sync && ./install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
