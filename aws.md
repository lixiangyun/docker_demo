```
#!/bin/bash
#ubuntu 16.04 TLS

apt-get update
apt-get -q install -y docker.io git golang
apt-get -q install -y curl host whois ethtool
apt-get -q install -y nmap dnsutils
apt-get -q install -y gcc
apt-get -q install -y iproute2 iptables
apt-get -q install -y net-tools
apt-get -q install -y iputils-ping

git clone https://github.com/lixiangyun/httpfile.git
cd httpfile
go build .

cd /root
mkdir .ssh
cd .ssh
ssh-keygen -t rsa -b 4096

cd /root


```
