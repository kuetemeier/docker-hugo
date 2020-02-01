# hugo-jk

*My Docker Image for HUGO - The world’s fastest framework for building websites*

## Short Version

`hugo`in an alpine based Docker Image, compiled with extended tags and some additinal features from our [jk development branch](https://github.com/kuetemeier/hugo/tree/jk).

## Long Version

This is the docker image we use to build and develop our website <https://kuetemeier.de>.
It is build out of the official [Hugo source files](https://github.com/gohugoio/hugo)
with some additional features out of our [jk development branch](https://github.com/kuetemeier/hugo/tree/jk).

For example support for [imgIX](https://www.imgix.com/) and ImageProxy.

When time has come, we will try to integrate this in the official Hugo project. Some features just need a
litte bit more polishing some more time to evolve and some just simply more documentation, before they may be
integrated in the official branch (the decision to do so is beyond our control).
