FROM alpine
MAINTAINER Andrew Taranik <me@pureclouds.net>

# Credentials for Nginx frontend (basic auth)
#
ENV ELK_USER admin
ENV ELK_PASS secret

# ELK components configuration files/dirs
#
ADD elastic  /usr/share/elasticsearch/config
ADD logstash /etc/logstash
ADD kibana   /etc/kibana
ADD nginx    /etc/nginx/conf.d

# Add openssl to create crypted htpassw file for nginx frontend
#
RUN apk add --no-cache openssl

VOLUME /usr/share/elasticsearch/config /etc/logstash /etc/kibana /etc/nginx/conf.d

ADD init.sh /init.sh
CMD ["/init.sh"]
