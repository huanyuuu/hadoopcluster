#!/bin/bash
hadoop_version="2.7.3"
hadoop_dir="/usr/local"
hadoop_home="${hadoop_dir}/hadoop"
cp -f /vagrant/scripts/hdfs-site.xml ${hadoop_home}/etc/hadoop
chown hadoop:hadoop ${hadoop_home}/etc/hadoop/hdfs-site.xml
chmod 644 ${hadoop_home}/etc/hadoop/hdfs-site.xml
mkdir /home/hadoop/journalnode
chown hadoop:hadoop /home/hadoop/journalnode


