在vps上执行
nohup ./proxy tbridge -p ":33022" -C proxy.crt -K proxy.key 1>bridge.out 2>&1 &
nohup ./proxy tserver -r ":32022@:22" -P "127.0.0.1:33022" -C proxy.crt -K proxy.key 1>server.out 2>&1 &

在家中机器上面执行
nohup ./proxy tclient -P "52.53.253.116:33022" -C proxy.crt -K proxy.key 1>client.out 2>&1 &

完成

代理其他服务
proxy tserver -r ":39411@:9411" -P "127.0.0.1:33022" -C proxy.crt -K proxy.key