# HUGO-jk

## HUGO (extended version + jk features) in a Container

*I actively use it for my [sites](https://kuetemeier.de), you can too!*

### What is included?

- HUGO - The world’s fastest framework for building websites
- compiled with extended tag
- `git` binary in container image for `--enableGitInfo` support
- additional features from my [jk development branch](https://github.com/kuetemeier/hugo/tree/jk)

For example it includes support for [imgIX](https://www.imgix.com/) and ImageProxy.

## Using this image

See a list of all [available Packages](https://github.com/kuetemeier/docker-hugo-jk/packages)

```shell
docker run --rm docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:1.1.0-jk-0.70.0 version
```

should output something like:

```text
Hugo Static Site Generator v0.70.0/extended linux/amd64 BuildDate: 2020-02-07T19:39:26Z
```

## Merging features into official HUGO sources

**When time has come, I will try to integrate the additional features into the official HUGO project.**

Some just need a litte bit more polishing, some more time to evolve and some just simply more documentation. And then they may eventually find their way into the official branch (the decision to do so is beyond our control).

But I need and use them right now to build my site. I actively use them and you can too. Free of charge, with this Container Image.

## Versioning

Packages (Releases) are tagged with a double version tag like `x.x.x-jk-x.x.x`.

The first version is the package release version. The second one is the included HUGO version.

## Development Notes

These notes are only for development are *not needed for a daily use in production*. You can safely skip them.

Use the `Makefile` for an easier life.

### Create the container localy

```shell
git clone git@github.com:kuetemeier/docker-hugo-jk.git
make build
```

### Run / Test the container

```shell
make run
```

### Develop process

1. Make changes / test / build locally
2. Commit your changes to the repo
3. Tag the changes `git tag x.x.x-jk-x.x.x` (see Versioning)
4. `git push --tags origin`
5. `make build`
6. `make login`
7. `make publish`

## License

Copyright © 2020 Jörg Kütemeier <joerg@kuetemeier.de>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
