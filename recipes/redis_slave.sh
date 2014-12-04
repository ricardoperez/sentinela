#!/bin/sh
. /vagrant/recipes/redis_server.sh

wget https://raw.githubusercontent.com/ricardoperez/redis-template/master/conf/redis-slave.conf -O /etc/redis/redis.conf

sudo /etc/init.d/redis-server start
cd ~
