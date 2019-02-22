FROM ubuntu:trusty
MAINTAINER Donn Lee <docker.build@pluza.com>

RUN apt-get update -y
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh

# Based on:
# https://github.com/nicolasff/webdis/blob/master/Dockerfile

RUN apt-get update -y \
    && apt-get install -yqq python-pip \
    && pip install envtpl \
    && apt-get clean
# Current dir is "/" at this point. And we are root.
RUN apt-get -y --force-yes install wget make gcc libevent-dev
RUN apt-get -y --force-yes install redis-server
RUN wget --no-check-certificate https://github.com/nicolasff/webdis/archive/0.1.2.tar.gz -O webdis-0.1.2.tar.gz
RUN tar -xvzf webdis-0.1.2.tar.gz
RUN cd webdis-0.1.2 && make && make install && cd ..
RUN rm -rf webdis-0.1.2 webdis-0.1.2.tar.gz
#RUN apt-get remove -y wget make gcc

ADD config/webdis.donn.json.tpl /etc/webdis.donn.json.tpl
ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]

EXPOSE 22 7379

