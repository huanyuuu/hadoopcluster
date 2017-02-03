#/bin/bash
#configuring ssh password-less login on all nodes except master node

[[ -d /home/hadoop/.ssh ]] || mkdir /home/hadoop/.ssh

#copy keypair from /vagrant
cp -rf /vagrant/.ssh/* /home/hadoop/.ssh

chown -R hadoop:hadoop /home/hadoop/.ssh
