#!/bin/bash

envtpl /etc/webdis.donn.json.tpl

/usr/sbin/sshd && /etc/init.d/redis-server start && /usr/local/bin/webdis /etc/webdis.donn.json && bash

