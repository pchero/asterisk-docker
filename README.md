# asterisk-docker
Docker for asterisk based on Debian.

A set of Dockerfiles for running asterisk-15.
Also checkout my wiki article @ http://wiki.pchero21.com.

You can pull the image from dockerhub.
Which is as simple as running:

$ docker pull pchero/asterisk

Based on Debian 8 jessie base image
Latest current available version of Asterisk 15
  More branches to come in the future.

Available with docker pull pchero/asterisk

Running it

docker run \
  -d \
  -p 8080:8080/tcp \
  -p 8081:8081/tcp \
  -p 5060:5060/tcp \
  -p 5060:5060/udp \
  -p 10000-10500:10000-10500/udp \
  --name asterisk \
  -t pchero/asterisk

