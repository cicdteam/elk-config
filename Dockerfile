FROM busybox
MAINTAINER Andrew Taranik <me@pureclouds.net>

ADD elastic/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
ADD logstash/logstash.conf    /etc/logstash/logstash.conf
ADD kibana/kibana.yml         /etc/kibana/kibana.yml

VOLUME /etc/logstash/logstash.conf
VOLUME /etc/kibana/kibana.yml
VOLUME /usr/share/elasticsearch/config/elasticsearch.yml
