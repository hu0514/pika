From centos

RUN yum install epel-release -y \
    && yum install snappy-devel -y \
    && yum install protobuf-devel -y \
    && yum install gflags-devel -y \
    && yum install glog-devel -y \
    && yum install wget vim unzip make gcc-c++ git -y
RUN cd /mnt \
    && git clone https://github.com/Qihoo360/pika.git \
    && cd pika \
    && make \
    && cp output/bin/pika /usr/sbin/ \
    && mkdir /home/pika \
    && cp output/conf/pika.conf /home/pika/ \
    && rm -rf /mnt/* \
    && yum clean all 
COPY ./files/setup.sh /tmp/
COPY ./files/pika.conf /home/pika/pika.conf
RUN chmod +x /tmp/setup.sh
ENTRYPOINT ["/tmp/setup.sh"]
