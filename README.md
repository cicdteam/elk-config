# Docker image with ELK-stack configs

# What is pure/elk-config?

`pure/elk-config` is docker image to provide configurations for dockerized ELK stack (Elasticsearch, Logstash, Kibana). Usually it runs as sidekick for ELK docker images.
It contains several VOLUMES that possible use from other containers by `--volumes-from` option:

# Example of usage

Start container with confg files:

```
docker run -d -i --name elk-config pure/elk-config
```

Use volumes from started container (as example for elasticsearch container):

```
docker run \
    -d \
    --name es \
    -p 9200:9200 
    --volumes-from elk-config:ro \
    -v /path/to/persistent/data:/usr/share/elasticsearch/data \
    elasticsearch:alpine
```

# Example how to use you own config files

- Clone git repo by `git clone https://github.com/pureclouds/elk-config.git`
- Edit configs in corresponding subdurs
- Build your own elk-config docker image by `docker build -t local/elk-config .`
- Start your own config container by `docker run -d -i --name elk-config local/elk-config`
- Start ELK stack containers with `--volumes-from elk-config` option

# Nginx frontend for kibana container

Image contais example configuration for Nginx that serve's as frontend proxy for kibana container to allow authorized access to dashboards.
You could pecify your own credentials via `-e ELK_USER=yourname -e ELK_PASS=yoursecret` when starting config container.
