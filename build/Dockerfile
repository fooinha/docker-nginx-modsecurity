FROM debian:sid
MAINTAINER fooinha <fooinha@gmail.com>
ARG MAINTANER_NAME=fooinha
ARG MAINTANER_EMAIL=fooinha@gmail.com
ARG PREFIX=/opt/spider

ENV MODSECURITY_INC ${PREFIX}/include
ENV MODSECURITY_LIB ${PREFIX}/lib

# Build argument
ARG DEBIAN_REPO_HOST=httpredir.debian.org

# Mirror to my location
RUN echo "deb http://${DEBIAN_REPO_HOST}/debian sid main" > /etc/apt/sources.list
RUN echo "deb-src http://${DEBIAN_REPO_HOST}/debian sid main" >> /etc/apt/sources.list

# Update
RUN DEBIAN_FRONTEND=noninteractive apt-get update

# Install build dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing \
    autoconf            \
    automake            \
    apt-utils           \
    bison               \
    build-essential     \
    curl                \
    devscripts          \
    dh-autoreconf       \
    doxygen             \
    flex                \
    g++                 \
    git-core            \
    libtool             \
    make                \
    pkg-config          \
    tree                \
    apache2-dev         \
    libcurl4-gnutls-dev \
    libgeoip-dev        \
    liblmdb-dev         \
    libpcre++-dev       \
    libxml2-dev         \
    libyajl-dev         \
    zlib1g-dev

# Prepared build dir
RUN mkdir /build
WORKDIR /build

# Compile libmodsecurity
RUN git clone https://github.com/SpiderLabs/ModSecurity
WORKDIR /build/ModSecurity
RUN git checkout -b v3/master origin/v3/master
RUN sh build.sh
RUN git submodule init
RUN git submodule update
RUN mkdir -p ${PREFIX}
RUN ./configure --prefix=${PREFIX}
RUN make
RUN make install
WORKDIR /build

# Clone ModSecurity-nginx
RUN git clone https://github.com/SpiderLabs/ModSecurity-nginx

# Compile nginx
RUN apt-get source nginx
RUN tree ${PREFIX}
RUN cd nginx-* && ./configure --add-module=/build/ModSecurity-nginx/ --prefix=${PREFIX}

#Install nginx
RUN cd nginx-* && make && make install

CMD ["/bin/bash"]
