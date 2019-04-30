FROM alpine:latest

RUN apk add --no-cache \
    bash \
    curl \
    git \
    openssh-client \
    rsync \
    libc6-compat \
    libstdc++

ENV HUGO_VERSION 0.55.4
ENV HUGO_TYPE=_extended
ENV HUGO_ID=hugo${HUGO_TYPE}_${HUGO_VERSION}

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID}_Linux-64bit.tar.gz | tar -xz \
    && mv hugo /usr/bin/hugo \
    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
    && mv minify /usr/bin/ \
    && rm -rf /usr/local/src \
    && deluser xfs \
    && addgroup -Sg 33 www-data \
    && adduser -SG www-data -u 33 -h /src www-data \
    && addgroup -Sg 1000 hugo \
    && adduser -SG hugo -u 1000 -h /work hugo

WORKDIR /work

EXPOSE 1313
EXPOSE 1314
