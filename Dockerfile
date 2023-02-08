FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y wget curl make clang pkg-config libssl-dev build-essential git jq ncdu bsdmainutils htop

COPY nibiru.sh nibiru.sh
RUN chmod +x nibiru.sh
RUN apt install sudo -y
RUN echo -e "MonNode\n" | /bin/bash nibiru.sh


EXPOSE 26656
EXPOSE 26657
ENTRYPOINT ["nibid", "start"] 
