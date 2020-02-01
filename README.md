# HUGO-jk

## HUGO (extended version + jk features) in a Container

*I actively use it for my [sites](https://kuetemeier.de), you can too!*

- HUGO - The world’s fastest framework for building websites
- compiled with extended tag
- and with additional features from my [jk development branch](https://github.com/kuetemeier/hugo/tree/jk)

For example it includes support for [imgIX](https://www.imgix.com/) and ImageProxy.

## Using this image

```
docker run docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:latest version
```

## Merging features into official HUGO sources

**When time has come, I will try to integrate the additional features into the official HUGO project.**

Some just need a litte bit more polishing, some more time to evolve and some just simply more documentation. And then they may eventually find their way into the official branch (the decision to do so is beyond our control).

But I need and use them right now to build my site. I actively use them and you can too. Free of charge, with this Container Image.

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
