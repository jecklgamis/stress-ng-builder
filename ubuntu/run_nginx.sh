#!/bin/bash

if [[ -r /etc/default/nginx ]]; then
    . /etc/default/nginx
fi
. /lib/init/vars.sh
. /lib/lsb/init-functions

echo "Nginx is up!, Download stress-ng binary from http://localhost:3080"
exec /usr/sbin/nginx

