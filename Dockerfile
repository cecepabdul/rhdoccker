FROM ubuntu:latest
MAINTAINER techworker

ARG VERSION=1.3

# install wget
RUN  apt-get update \
  && apt-get install -y wget unzip iproute2 \
  && rm -rf /var/lib/apt/lists/*

# add "rhminer" user
RUN useradd -ms /bin/bash rhminer
RUN echo "rhminer:rhminer" | chpasswd

USER rhminer

WORKDIR /home/rhminer

RUN wget https://github.com/polyminer1/rhminer/releases/download/${VERSION}/rhminer.${VERSION}.Linux.CPU.zip
RUN unzip rhminer.${VERSION}.Linux.CPU.zip

CMD ["/home/rhminer/miner.sh"]
