FROM ubuntu-debootstrap:latest

COPY install.sh install.sh

RUN sync
RUN tr -d '\r' < "install.sh" > temp && mv -f temp "install.sh"
RUN chmod +x install.sh && sync
RUN ./install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source

CMD 'bash'
