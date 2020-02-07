# Copyright © 2020 Jörg Kütemeier <joerg@kuetemeier.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM golang:1.13-alpine AS builder

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
	apk add --no-cache ca-certificates libc6-compat libstdc++ git

VOLUME /site
WORKDIR /site

# Expose port for live server and second language
EXPOSE 1313
EXPOSE 1314

ENTRYPOINT ["hugo"]
CMD ["--help"]
