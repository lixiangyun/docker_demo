启动跟踪服务：
docker run -d -p 9411:9411 --restart=always openzipkin/zipkin

浏览器打开：
http://192.168.0.119:9411/zipkin/

AWS实例：

URL: ec2-18-221-130-112.us-east-2.compute.amazonaws.com
IP : 18.221.130.112 ubuntu
key: 

---- BEGIN SSH2 PUBLIC KEY ----
Subject: linimbus
Comment: "linimbus@DESKTOP-XIAOMIPC"
ModBitSize: 2048
AAAAB3NzaC1yc2EAAAADAQABAAABAQC9hDs/TsLrzSMqv8jY2/xAERXvUSXxGGmL
85Ojxy7TThZWawvmvozW5/bNtkR4bmfaeB0AgBXjMhcuy/YkAeBoTZyOC4b2t7RT
PUn/X6ydkUxvFSDC8Nu9Yyiwax8Gj1HFimjEOf/iJgIyz3aohH5NtAcbfguap5Cc
RinQwYU2eQowj0wGEa3/vzwymAToWIE9aAWei4ZwUQR+iVd1TrIUOgmVEk0PVWqJ
JgmdTO4uWz30uPn7B+GhCWQ4E2UR0KEAwLif6ytQM9qAdFt+TrBrnCpZVtwR/lld
J0SBK1NPQoL8cMbRDGRc7zfUG0pRMrPqtg7yJUO0jyZPIQlYnBOD
---- END SSH2 PUBLIC KEY ----


go get -v -u github.com/opentracing/opentracing-go

go get -v -u github.com/openzipkin/zipkin-go-opentracing

export GOPATH=/root/golang


