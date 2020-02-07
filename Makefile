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

TAG_COMMIT := $(shell git rev-list --abbrev-commit --tags --max-count=1)

# `2>/dev/null` suppress errors and `|| true` suppress the error codes.
TAG := $(shell git describe --abbrev=0 --tags ${TAG_COMMIT} 2>/dev/null || true)

# here we strip the version prefix
VERSION := $(TAG:v%=%)

.PHONY: all build login publish clean run

all: build

build:
	@echo "Version Tag: $(VERSION)"
	docker build -t docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:$(VERSION) .

login:
	echo $GITHUB_TOKEN | docker login --password-stdin -u kuetemeier docker.pkg.github.com

publish:
	docker push docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:$(VERSION)

clean:
	docker image rm docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:$(VERSION)

run:
	docker run --rm docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:$(VERSION) version
