#!/bin/sh
yum install make gcc wget -y

cd /tmp
wget http://download.redis.io/releases/redis-2.8.17.tar.gz
tar xzf redis-2.8.17.tar.gz
cd redis-2.8.17
make
make install

cd ..
wget https://raw.githubusercontent.com/ricardoperez/redis-template/master/init/redis-server -O /etc/init.d/redis-server
sudo chmod u+x /etc/init.d/redis-server

if [ ! -d '/etc/redis' ]; then
  sudo mkdir /etc/redis/
fi

if [ ! -d '/var/lib/redis' ]; then
  sudo mkdir /var/lib/redis/
fi

