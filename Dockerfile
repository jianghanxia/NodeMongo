FROM ubuntu:14.04
MAINTAINER jianghanxia <jianghanxia@qq.com>

#将源改为中文区
RUN sed -e "s/\/archive.ubuntu.com/\/cn.archive.ubuntu.com/g" --in-place /etc/apt/sources.list
    
RUN apt-get update && apt-get -y upgrade && apt-get -y install curl

#安装Node.JS
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - && apt-get install -y nodejs

#安装MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 \
  && echo 'deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.2 multiverse' | tee /etc/apt/sources.list.d/mongodb-org-3.2.list \
  && apt-get update && apt-get upgrade -y && apt-get install -y mongodb-org

#清理系统
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]

ENTRYPOINT ["/bin/bash"]