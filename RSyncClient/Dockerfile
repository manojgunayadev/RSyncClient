#
# Super simple example of a Dockerfile
#
FROM ubuntu:14.04
MAINTAINER Manoj Gunawardena "manojg@wso2.com"

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update

ADD scripts /scripts

EXPOSE 22
RUN apt-get update && apt-get install -y openssh-server && apt-get -y install sshpass
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

command=/usr/sbin/sshd -D