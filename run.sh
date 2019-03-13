#!/bin/bash

if [[ -z "${PASSWORD}" ]]; then
  echo 'root:sppQ!f*<r+]T`X-Zn\/YD%HeQ)n,.k]_R.VN2' |chpasswd
  echo 'sppQ!f*<r+]T`X-Zn\/YD%HeQ)n,.k]_R.VN2'
else
  echo "root:${PASSWORD}" |chpasswd -e
  echo "${PASSWORD}"
fi

envtpl /etc/webdis.donn.json.tpl

/usr/sbin/sshd && /etc/init.d/redis-server start && /usr/local/bin/webdis /etc/webdis.donn.json && bash

