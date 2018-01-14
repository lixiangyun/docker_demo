cd /root/proxy
nohup ./proxy http -t tcp -p ":8080" -T tls -P "ssh.lixiangyun.top:38080" -C /etc/proxy/proxy.crt -K /etc/proxy/proxy.key 1>proxy.out 2>&1 &

nohup ./proxy tclient -P "ssh.lixiangyun.top:33022" -C proxy.crt -K proxy.key 1>tclient.out 2>&1 &