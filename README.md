## 常用docker命令
- 清除坏的\<none>:\<none>镜像</br>
  docker rmi $(docker images -f "dangling=true" -q)

- 杀死所有正在运行的容器</br>
docker kill $(docker ps -a -q)

- 删除所有已经停止的容器</br>
docker rm $(docker ps -a -q)

- 删除所有未打 dangling 标签的镜像</br>
docker rmi $(docker images -q -f dangling=true)

- 删除所有镜像</br>
docker rmi $(docker images -q)

- 为这些命令创建别名</br>
 ~/.bash_aliases
    - 杀死所有正在运行的容器</br>
    alias dockerkill='docker kill $(docker ps -a -q)'
    - 删除所有已经停止的容器</br>
    alias dockercleanc='docker rm $(docker ps -a -q)'
    - 删除所有未打标签的镜像</br>
    alias dockercleani='docker rmi $(docker images -q -f dangling=true)'
    - 删除所有已经停止的容器和未打标签的镜像.
    alias dockerclean='dockercleanc || true && dockercleani'

- 另附上docker常用命令
    - 查看版本</br>
      docker version 
    - 搜索可用docker镜像</br>
      docker search tutorial
    - 下载镜像</br>
      docker pull learn/tutorial
    - 在docker容器中运行hello world!</br>
      docker run learn/tutorial echo "hello word"
    - 在容器中安装新的程序
      docker run learn/tutorial apt-get install -y ping
 
- 保存镜像</br>
首先使用docker ps -l命令获得安装完ping命令之后容器的id。然后把这个镜像保存为learn/ping。</br>
 提示：</br>
    1. 运行docker commit，可以查看该命令的参数列表。</br>
    2. 你需要指定要提交保存容器的ID。(译者按：通过docker ps -l 命令获得)</br>
    3. 无需拷贝完整的id，通常来讲最开始的三至四个字母即可区分。（译者按：非常类似git里面的版本号)</br>
 
- 正确的命令</br>
docker commit 698 learn/ping

- 运行新的镜像</br>
docker run lean/ping ping www.google.com

- 检查运行中的镜像</br>
 现在你已经运行了一个docker容器，让我们来看下正在运行的容器。使用docker ps命令可以查看所有正在运行中的容器列表，使用docker inspect命令我们可以查看更详细的关于某一个容器的信息。</br>
    - 目标：查找某一个运行中容器的id，然后使用docker inspect命令查看容器的信息。</br>
    - 提示：可以使用镜像id的前面部分，不需要完整的id。</br>
    - 正确的命令：docker inspect efe </br>

- 一种是使用save和load命令</br>
使用例子如下：</br>
    - docker save ubuntu:load > /root/ubuntu.tar
    - docker load<ubuntu.tar


- 一种是使用export和import命令</br>
使用例子如下：</br>
    - docker export 98ca36> ubuntu.tar</br>
    - cat ubuntu.tar | sudo docker import - ubuntu:import</br>


- 启动本地仓库</br>
    - docker run -d -p 5000:5000 -v /opt/registry:/var/lib/registry --restart=always registry:latest</br>

    - docker push ubuntu160403:5000/ubuntu:16.04</br>

    - https问题：</br>
      vim /etc/default/docker</br>

    - 增加: </br>
      DOCKER_OPTS="--insecure-registry=ubuntu160403:5000"</br>

    - 重启Docker</br>
      service docker restart</br>

    - 查看镜像
      curl http://ubuntu160403:5000/v2/search

- 容器监控服务</br>
    - 开启远程管理
        - vi /etc/sysconfig/docker 
        - DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock"
    - 启动docker监控服务
        - docker run -d --restart=always --privileged -p 9000:9000 -v /opt/portainer:/data portainer/portainer
        - 添加需要管理的dockerd服务endpoint：IP:2375
