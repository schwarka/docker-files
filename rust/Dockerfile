FROM ubuntu-debootstrap:latest

COPY install.sh install.sh

RUN sync && \
    tr -d '\r' < "install.sh" > temp && mv -f temp "install.sh" && \
    sync && \
    chmod +x install.sh && \
    sync && \
    ./install.sh && rm install.sh

VOLUME ["/code"]
WORKDIR /code

CMD 'bash'
