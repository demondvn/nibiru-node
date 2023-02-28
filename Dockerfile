FROM golang

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y wget curl make clang pkg-config libssl-dev build-essential git jq ncdu bsdmainutils htop
ARG NIBIRU_NODENAME=
RUN git clone https://github.com/NibiruChain/nibiru.git --branch v0.19.2 && cd nibiru && make build \
    && mv /build/nibid /usr/local/bin/ || exit

COPY nibiru.sh nibiru.sh
RUN chmod +x nibiru.sh
RUN apt install sudo -y
# RUN echo -e "MonNode\n" | /bin/bash nibiru.sh


EXPOSE 26656
EXPOSE 26657
CMD ./nibiru.sh
