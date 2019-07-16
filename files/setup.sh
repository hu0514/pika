#!/bin/bash
if [ ! -d /data/pika ];then
    mkdir -p /data/pika
fi
if [ -f /data/pika/pika.conf ];then
    exec /usr/sbin/pika -c /data/pika/pika.conf
else
    cp /home/pika/pika.conf /data/pika/pika.conf
    exec /usr/sbin/pika -c /data/pika/pika.conf
fi
