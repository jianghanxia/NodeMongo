# About NodeJS&MongoDB of Docker
# Version:1.0.0

FROM centos:7
MAINTAINER Zorc <939225037@qq.com>

RUN yum -y update; yum clean all

# install the epel
RUN yum -y install epel-release; yum clean all

# install the nodejs and npm
RUN yum -y install nodejs npm; yum clean all

# install the MongoDB
RUN yum -y install mongodb-org; chkconfig mongod on; yum clean all

ADD . /src

EXPOSE 3000,27017

CMD ["node", "/src/bin/www"]