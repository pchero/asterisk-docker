FROM debian:8

MAINTAINER Sungtae Kim <pchero@gmail.com>


## Get all asterisk prerequsites 
RUN apt-get update
RUN apt-get install -y \
  build-essential \
  openssl \
  libxml2-dev \
  libncurses5-dev \
  uuid-dev \
  sqlite3 \
  libsqlite3-dev \
  pkg-config \
  curl \
  libjansson-dev \
  libssl-dev \
  vim \
  less \
  libopus-dev \
  opus-tools \
  xmlstarlet



## Download and decompress asterisk 15
RUN mkdir /asterisk
RUN curl -s http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-15-current.tar.gz | tar xz -C /asterisk --strip-components=1



## Asterisk compilation & installation
WORKDIR /asterisk
RUN ./configure
RUN make menuselect.makeopts

# enable opus codec module
RUN menuselect/menuselect --enable codec_opus menuselect.makeopts

# make & make install
RUN make
RUN make install
RUN make samples



## Run Asterisk
CMD ["/usr/sbin/asterisk", "-fvvvvvvv"]



