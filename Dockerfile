FROM ubuntu:bionic

# ssh server to ease debugging

RUN apt-get update -y
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh

# Webdis
# forked from https://github.com/donnlee/webdis
# based on:
# https://github.com/nicolasff/webdis/blob/master/Dockerfile

RUN apt-get update -y \
    && apt-get install -yqq python-pip \
    && pip install envtpl \
    && apt-get clean
RUN apt-get -y --force-yes install wget make gcc libevent-dev
RUN apt-get -y --force-yes install redis-server
RUN wget --no-check-certificate https://github.com/nicolasff/webdis/archive/0.1.2.tar.gz -O webdis-0.1.2.tar.gz
RUN tar -xvzf webdis-0.1.2.tar.gz
RUN cd webdis-0.1.2 && make && make install && cd ..
RUN rm -rf webdis-0.1.2 webdis-0.1.2.tar.gz

ADD config/webdis.donn.json.tpl /etc/webdis.donn.json.tpl
ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

ADD config/redis.conf /etc/redis/redis.conf

CMD ["/root/run.sh"]

EXPOSE 22 6379 7379
