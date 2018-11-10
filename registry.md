## docker容器仓

### 启动

```
export IP=10.10.11.1
docker run -d -v /opt/registry:/var/lib/registry -p 5000:5000 --restart=always --privileged=true --name registry-srv registry:latest
docker run -d -p 8080:8080 --name registry-web --link registry-srv -e REGISTRY_URL=http://$IP:5000/v2 -e REGISTRY_NAME=$IP:5000 hyper/docker-registry-web 
```

### 访问

http://IP:8080/
