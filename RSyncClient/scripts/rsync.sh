#!/bin/bash
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -f verizon1.rsa -t rsa -N ''
sshpass -p "screencast" ssh-copy-id -o "StrictHostKeyChecking no" -i ~/.ssh/verizon1.rsa.pub mgtgw1.marathon.slave.mesos. -p 31222
sshpass -p "screencast" ssh-copy-id -o "StrictHostKeyChecking no" -i ~/.ssh/verizon1.rsa.pub gw1.marathon.slave.mesos. -p 31223
while true 
do 
echo 'fetching' 
shpass -p "screencast" ssh -o -p 31222 "StrictHostKeyChecking no" -i root@mgtgw1.marathon.slave.mesos. 'tar -cf - -C /mnt/wso2/wso2am-1.10.0/repository/deployment/server/synapse-configs' | shpass -p "screencast" ssh -p 31223 -o "StrictHostKeyChecking no" -i root@gw1.marathon.slave.mesos. 'tar -xvpf - -C /mnt/wso2/wso2am-1.10.0/repository/deployment/server'
sleep 10
done
