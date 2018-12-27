# etcd启动

## etcdctl配置
```
./etcdctl --endpoints http://192.168.0.1:2379 set /flannel/network/config '{ "Network": "10.1.0.0/16", "Backend": { "Type": "vxlan", "VNI": 1 } }'
```
```
./etcdctl set /coreos.com/network/blue/config  '{ "Network": "10.1.0.0/16", "Backend": { "Type": "vxlan", "VNI": 1 } }'
./etcdctl set /coreos.com/network/green/config '{ "Network": "10.2.0.0/16", "Backend": { "Type": "vxlan", "VNI": 2 } }'
./etcdctl set /coreos.com/network/red/config   '{ "Network": "10.3.0.0/16", "Backend": { "Type": "vxlan", "VNI": 3 } }'
```


# 启动flannel
```
./flanneld --etcd-prefix=/flannel/network --etcd-endpoints=http://192.168.0.1:2379 --iface="eth0"
```

## 环境变量配置
```
vi /run/flannel/subnet.env
```

## 查看内容
```
FLANNEL_NETWORK=10.1.0.0/16
FLANNEL_SUBNET=10.1.53.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=false
```

## 创建docker配置
```
cp /run/flannel/subnet.env /run/flannel/docker
```

## 编辑内容
```
DOCKER_OPT_BIP="--bip=10.1.53.1/24"
DOCKER_OPT_MTU=1450
DOCKER_OPT_IPMASQ=true
DOCKER_NETWORK_OPTIONS=" --bip=10.1.53.1/24 --ip-masq=true --mtu=1450 "
```

# docker启动选项

```
vi /lib/systemd/system/docker.service 
```

## 编辑内容
```
EnvironmentFile=-/run/flannel/subnet.env
ExecStart=/usr/bin/dockerd -H fd:// $DOCKER_OPTS $DOCKER_NETWORK_OPTIONS
```

## 重启docker
```
systemctl daemon-reload
systemctl restart docker 
```

## 查看网络
```
ifconfig
```
