#/bin/bash
#get ssh servers' public key on all nodes

[[ -d /home/hadoop/.ssh ]] || mkdir /home/hadoop/.ssh

#get ssh server public key
awk '{ if ($2 != "localhost") system("/usr/bin/ssh-keyscan -t ecdsa -H " $2) }' /etc/hosts > /home/hadoop/.ssh/known_hosts

chown -R hadoop:hadoop /home/hadoop/.ssh
