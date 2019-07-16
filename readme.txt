使用dockerfile构建docker镜像
docker build -t pika:3.1 .
运行容器
docker run -d \
    --network host \
    --name pika \
    -v /data:/data \
    pika:3.1