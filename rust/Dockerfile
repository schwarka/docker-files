FROM ubuntu-debootstrap:latest

COPY install.sh install.sh
COPY startup.sh startup.sh

RUN sync

RUN tr -d '\r' < "install.sh" > temp && mv -f temp "install.sh"
RUN tr -d '\r' < "startup.sh" > temp && mv -f temp "startup.sh"

RUN chmod +x install.sh && chmod +x startup.sh && sync 

RUN ./install.sh && rm install.sh

VOLUME ["/source"]
VOLUME ["/rust-src"]
WORKDIR /source

CMD bash -C '/startup.sh';'bash'
