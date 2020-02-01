FROM golang:1.13-alpine AS builder

# Optionally set HUGO_BUILD_TAGS to "extended" when building like so:
#   docker build --build-arg HUGO_BUILD_TAGS=extended .
ARG HUGO_BUILD_TAGS=extended

ARG CGO=1
ENV CGO_ENABLED=${CGO}
ENV GOOS=linux
ENV GO111MODULE=on

WORKDIR /build/

# gcc/g++ are required to build SASS libraries for extended version
RUN apk update && \
	apk add --no-cache gcc g++ musl-dev git && \
	go get github.com/magefile/mage

RUN git clone https://github.com/kuetemeier/hugo.git

WORKDIR /build/hugo

RUN git checkout jk

RUN mage hugo && mage install

# ---

FROM alpine:3.11

COPY --from=builder /go/bin/hugo /usr/bin/hugo

# libc6-compat & libstdc++ are required for extended SASS libraries
# ca-certificates are required to fetch outside resources (like Twitter oEmbeds)
RUN apk update && \
	apk add --no-cache ca-certificates libc6-compat libstdc++

VOLUME /site
WORKDIR /site

# Expose port for live server
EXPOSE 1313

ENTRYPOINT ["hugo"]
CMD ["--help"]


#RUN go build



#RUN apk add --no-cache \
#    bash \
#    curl \
#    git \
#    openssh-client \
#    rsync \
#    libc6-compat \
#    libstdc++

#ENV HUGO_VERSION 0.55.4
#ENV HUGO_TYPE=_extended
#ENV HUGO_ID=hugo${HUGO_TYPE}_${HUGO_VERSION}

#RUN mkdir -p /usr/local/src \
#    && cd /usr/local/src \
#    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID}_Linux-64bit.tar.gz | tar -xz \
#    && mv hugo /usr/bin/hugo \
#    && curl -L https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
#    && mv minify /usr/bin/ \
#    && rm -rf /usr/local/src \
#    && deluser xfs \
#    && addgroup -Sg 33 www-data \
#    && adduser -SG www-data -u 33 -h /src www-data \
#    && addgroup -Sg 1000 hugo \
#    && adduser -SG hugo -u 1000 -h /work hugo

#WORKDIR /work

#EXPOSE 1313
#EXPOSE 1314
