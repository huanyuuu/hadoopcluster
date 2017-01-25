#!/bin/bash

tar -xvf /vagrant/zookeeper-3.4.9.tar.gz -C /usr/local
mv /usr/local/zookeeper-3.4.9 /usr/local/zookeeper
cp -f /vagrant/scripts/zoo/zoo.cfg /usr/local/zookeeper/conf


mkdir /usr/local/zookeeper/logs
mkdir /usr/local/zookeeper/zoodata
cat <<EOT >> /home/hadoop/.bashrc
# Set ZOOKEEPER_HOME
export ZOOKEEPER_HOME=/usr/local/zookeeper
# Add ZOOKEEPER bin  directory to PATH
export PATH=\$PATH:\$ZOOKEEPER_HOME/bin
EOT

chown -R hadoop:hadoop /usr/local/zookeeper