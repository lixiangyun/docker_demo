FROM ubuntu:xenial
MAINTAINER lixiangyun "linimbus@126.com"

RUN apt-get update 
RUN apt-get -q install -y curl host whois ethtool wget
RUN apt-get -q install -y nmap dnsutils net-tools tcpdump iputils-ping
RUN apt-get -q install -y iproute2 iptables
RUN apt-get -q install -y strace sysdig ltrace 
RUN apt-get -q install -y gcc golang git

RUN echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.7 main" | tee /etc/apt/sources.list.d/llvm.list
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -

RUN apt-get update
RUN apt-get -y install bison build-essential cmake flex git libedit-dev libllvm3.7 llvm-3.7-dev libclang-3.7-dev python zlib1g-dev libelf-dev

RUN apt-get -y install luajit luajit-5.1-dev

WORKDIR /opt
RUN git clone https://github.com/iovisor/bcc.git
RUN mkdir /opt/bcc/build

WORKDIR /opt/bcc/build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr
RUN make
RUN make install

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod u+x /usr/local/bin/start.sh
ENTRYPOINT /usr/local/bin/start.sh
