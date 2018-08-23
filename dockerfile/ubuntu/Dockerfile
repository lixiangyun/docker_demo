FROM ubuntu:xenial
MAINTAINER lixiangyun "linimbus@126.com"

RUN apt-get update 
RUN apt-get -q install -y curl host whois ethtool
RUN apt-get -q install -y nmap dnsutils
RUN apt-get -q install -y gcc
RUN apt-get -q install -y iproute2 iptables
RUN apt-get -q install -y net-tools
RUN apt-get -q install -y iputils-ping

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod u+x /usr/local/bin/start.sh
ENTRYPOINT /usr/local/bin/start.sh
