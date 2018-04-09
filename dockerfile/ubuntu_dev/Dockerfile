FROM ubuntu:16.04
MAINTAINER lixiangyun "linimbus@126.com"

RUN apt-get update 
RUN apt-get -q install -y curl host whois ethtool
RUN apt-get -q install -y nmap dnsutils
RUN apt-get -q install -y gcc

WORKDIR /home

CMD ["/bin/bash"]
