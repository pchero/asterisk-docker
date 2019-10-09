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
  xmlstarlet \
  libsrtp0 \
  libsrtp0-dev \
  libedit-dev



## Download and decompress asterisk 16
RUN mkdir /asterisk
RUN curl -s http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16.6.0.tar.gz | tar xz -C /asterisk --strip-components=1



## Asterisk compilation & installation
WORKDIR /asterisk
RUN ./configure --with-jansson-bundled
RUN make menuselect.makeopts

# enable opus codec module
RUN menuselect/menuselect --enable codec_opus menuselect.makeopts

# make & make install
RUN make
RUN make install
RUN make samples



## Run Asterisk
CMD ["/usr/sbin/asterisk", "-fvvvvvvv"]



