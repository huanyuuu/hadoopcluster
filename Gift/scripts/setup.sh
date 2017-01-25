#!/bin/bash

hadoop_version="2.7.3"
hadoop_dir="/usr/local"
hadoop_home="${hadoop_dir}/hadoop"

#extract hadoop tarball
tar -xvf /vagrant/hadoop-${hadoop_version}.tar.gz -C ${hadoop_dir}
mv ${hadoop_dir}/hadoop-${hadoop_version} ${hadoop_home}
chown -R hadoop:hadoop ${hadoop_home}

#Setup Hadoop Environment 
echo "Setup Hadoop Environment..."

cat <<EOT >> /home/hadoop/.bashrc
# Set HADOOP_HOME
export HADOOP_HOME=${hadoop_home}
# Set JAVA_HOME 
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# Add Hadoop bin and sbin directory to PATH
export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin
EOT

# Update hadoop-env.sh 
sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-8-oracle:' ${hadoop_home}/etc/hadoop/hadoop-env.sh
sed -i "/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=${hadoop_home}/etc/hadoop:" ${hadoop_home}/etc/hadoop/hadoop-env.sh

# Update Configuration Files
cp -f /vagrant/scripts/core-site.xml ${hadoop_home}/etc/hadoop

# hdfs-site.xml using default setting

# Copy mapred-site.xml, set framework to yarn
cp -f /vagrant/scripts/mapred-site.xml ${hadoop_home}/etc/hadoop
chown hadoop:hadoop ${hadoop_home}/etc/hadoop/mapred-site.xml
chmod 644 ${hadoop_home}/etc/hadoop/mapred-site.xml

# Copy yarn-site.xml, set ResourceManager hostanme
cp -f /vagrant/scripts/yarn-site.xml ${hadoop_home}/etc/hadoop

# Copy slaves file, list all DataNode and NodeManager 
cp -f /vagrant/scripts/slaves ${hadoop_home}/etc/hadoop
