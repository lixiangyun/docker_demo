## 容器监控服务
### 开启远程管理
 - vi /etc/sysconfig/docker "or" vi /etc/default/docker
 - DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock"
 - vi /lib/systemd/system/docker.service
 - EnvironmentFile=-/etc/default/docker
 - ExecStart=/usr/bin/dockerd -H fd:// $DOCKER_OPTS
 - systemctl daemon-reload
 - service docker restart

### 启动docker监控服务
 - docker run -d --restart=always --privileged --network=host -v /opt/portainer:/data portainer/portainer
 - 添加需要管理的dockerd服务endpoint：IP:2375

## 访问
http://nodeip:9000/
