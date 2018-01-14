FROM golang:1.8.1

WORKDIR /go/src/test/
ENV GOPATH=/go/src/test/
ENV GOOS=linux
ENV CGO_ENABLED=0

RUN go get -u -v github.com/lixiangyun/goproxy

WORKDIR /go/src/test/src/github.com/lixiangyun/goproxy

RUN go build .

RUN ls -il

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/

RUN cp -rf /go/src/test/src/github.com/lixiangyun/goproxy/goproxy ./proxy

RUN chmod +x *

COPY ./proxy.crt .
COPY ./proxy.key .

EXPOSE 38080

# docker build -t proxyserver:1.0 .
# docker run -d -p 8080:38080 --restart=always proxyserver:1.0

ENTRYPOINT ["./proxy", "http", "-t", "tls", "-p", ":38080", "-C", "./proxy.crt" ,"-K" ,"./proxy.key"]