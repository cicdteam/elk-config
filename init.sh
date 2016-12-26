#!/bin/sh

sysctl -w vm.max_map_count=262144

echo -n "${ELK_USER}:" > /etc/nginx/conf.d/htpasswd.users
openssl passwd -apr1 -noverify "${ELK_PASS}" >> /etc/nginx/conf.d/htpasswd.users
