#!/bin/sh

echo -n "${ELK_USER}:" > /etc/nginx/conf.d/htpasswd.users
openssl passwd -apr1 -noverify "${ELK_PASS}" >> /etc/nginx/conf.d/htpasswd.users
