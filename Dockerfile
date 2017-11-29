FROM debian:8

MAINTAINER Sungtae Kim <pchero@gmail.com>

# Get all asterisk prerequsites 
RUN apt-get update
RUN apt-get install -y build-essential openssl libxml2-dev libncurses5-dev uuid-dev sqlite3 libsqlite3-dev pkg-config curl libjansson-dev libssl-dev

# Download and decompress asterisk 15
RUN curl -s http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-15-current.tar.gz | tar xz

# Asterisk compilation & installation
RUN cd asterisk-*; ./configure; make; make install; make samples

# Run Asterisk
CMD ["/usr/sbin/asterisk", "-fvvvvvvv"]
