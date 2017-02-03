#!/bin/bash
#configuring ssh password-less login on master node

[[ -d /home/hadoop/.ssh ]] || mkdir /home/hadoop/.ssh

ssh-keygen -t rsa -P '' -f /home/hadoop/.ssh/id_rsa
cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
chown -R hadoop:hadoop /home/hadoop/.ssh

#copy keypair back to /vagrant
cp -rf /home/hadoop/.ssh /vagrant
