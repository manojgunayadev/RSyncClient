#!/bin/bash
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -f verizon.rsa -t rsa -N ''
sshpass -p "screencast" ssh-copy-id -o "StrictHostKeyChecking no" -i ~/.ssh/verizon.rsa.pub mgtgw1.marathon.slave.mesos. -p 31222
sshpass -p "screencast" ssh-copy-id -o "StrictHostKeyChecking no" -i ~/.ssh/verizon.rsa.pub gw1.marathon.slave.mesos. -p 31223
while true 
do 
ssh -o "StrictHostKeyChecking no" -i ~/.ssh/verizon root@mgtgw1.marathon.slave.mesos. 'tar -cf - -C /mnt/wso2/wso2am-1.10.0/repository/deployment/server/synapse-configs' | ssh -o "StrictHostKeyChecking no" -i ~/.ssh/verizon root@gw1.marathon.slave.mesos. 'tar -xvpf - -C /mnt/wso2/wso2am-1.10.0/repository/deployment/server'
sleep 10
done
