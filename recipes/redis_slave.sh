#!/bin/sh
. redis_server.sh

wget https://raw.githubusercontent.com/ricardoperez/redis-template/master/redis-slave.conf -O /etc/redis/redis.conf

sudo /etc/init.d/redis-server start
cd ~