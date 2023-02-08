FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y wget curl make clang pkg-config libssl-dev build-essential git jq ncdu bsdmainutils htop
# WORKDIR /defund
COPY defund.sh defund.sh
RUN chmod +x defund.sh
RUN apt install sudo -y
RUN echo -e "MonNode\n" | /bin/bash defund.sh

# VOLUME ~/.defund/
EXPOSE 26656
EXPOSE 26657
ENTRYPOINT ["nibid", "start"] 
