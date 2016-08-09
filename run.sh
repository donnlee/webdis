#!/bin/bash

envtpl /etc/webdis.donn.json.tpl

/etc/init.d/redis-server start && /usr/local/bin/webdis /etc/webdis.donn.json && bash

