FROM ubuntu:xenial
MAINTAINER lixiangyun "linimbus@126.com"

RUN apt-get update 
RUN apt-get -q install -y curl host whois ethtool
RUN apt-get -q install -y nmap dnsutils
RUN apt-get -q install -y gcc
RUN apt-get -q install -y iproute2 iptables
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /home

CMD ["/bin/bash"]
