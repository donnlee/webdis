FROM ubuntu:trusty
MAINTAINER Donn Lee <docker.build@pluza.com>

# Based on:
# https://github.com/nicolasff/webdis/blob/master/Dockerfile

RUN apt-get update -y
RUN apt-get -y --force-yes install wget make gcc libevent-dev
RUN apt-get -y --force-yes install redis-server
RUN wget --no-check-certificate https://github.com/nicolasff/webdis/archive/0.1.2.tar.gz -O webdis-0.1.2.tar.gz
RUN tar -xvzf webdis-0.1.2.tar.gz
RUN cd webdis-0.1.2 && make && make install && cd ..
RUN rm -rf webdis-0.1.2 webdis-0.1.2.tar.gz
#RUN apt-get remove -y wget make gcc

ADD config/webdis.prod.json /etc/webdis.prod.json

CMD /etc/init.d/redis-server start && /usr/local/bin/webdis /etc/webdis.prod.json && bash

EXPOSE 7379
