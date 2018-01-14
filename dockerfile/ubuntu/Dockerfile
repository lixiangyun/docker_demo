FROM ubuntu:16.04
MAINTAINER lixiangyun "linimbus@126.com"

RUN apt-get update 
RUN apt-get -q install -y curl host whois ethtool
RUN apt-get -q install -y nmap dnsutils wireless-tools

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod u+x /usr/local/bin/start.sh
ENTRYPOINT /usr/local/bin/start.sh
