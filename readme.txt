使用dockerfile构建docker镜像
docker build -t pika:3.1 .
运行容器
docker run -d \
    --network host \
    --name pika \
    -v /data:/data \
    pika:3.1


主从
    master配置不变
    slave修改pika.conf添加以下代码
    #repliacation
    slaveof: masterip:masterport    

同步数据
    slaveof host port
    slave no one


sentinel
    获取工具 
    wget https://github.com/pourer/pikamgr/releases/download/v1.0.0-alpha/pikamgr-linux-x86_64-v1.0.0-alpha.tar.gz

    sentinel.conf

    bind 0.0.0.0
    port 26379
    daemonize yes
    logfile /log/sentinel.log
    sentinel monitor mymaster 192.168.100.15 9221 2
    sentinel down-after-milliseconds mymaster 3000
    sentinel failover-timeout mymaster 90000

    运行命令
    /opt/redis-sentinel  /opt/sentinel.conf