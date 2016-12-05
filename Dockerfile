FROM fooinha/nginx-modsecurity:build
MAINTAINER fooinha <fooinha@gmail.com>
ARG MAINTANER_NAME=fooinha
ARG MAINTANER_EMAIL=fooinha@gmail.com

ENV MODSECURITY_INC ${PREFIX}/include
ENV MODSECURITY_LIB ${PREFIX}/lib

RUN apt-get remove -y \
    autoconf            \
    automake            \
    apt-utils           \
    bison               \
    build-essential     \
    devscripts          \
    dh-autoreconf       \
    doxygen             \
    flex                \
    g++                 \
    git-core            \
    libtool             \
    make                \
    pkg-config          \
    apache2-dev         \
    libcurl4-gnutls-dev \
    libgeoip-dev        \
    liblmdb-dev         \
    libpcre++-dev       \
    libxml2-dev         \
    libyajl-dev         \
    zlib1g-dev

RUN apt-get -y autoremove

RUN rm -rf /build

EXPOSE 80

CMD ["/opt/spider/sbin/nginx", "-g", "daemon off;"]
