# hugo-jk (hugo extended version + jk features) in a Docker Container

- HUGO - The world’s fastest framework for building websites
- compiled with extended tag
- and with additional features from my [jk development branch](https://github.com/kuetemeier/hugo/tree/jk)

For example it includes support for [imgIX](https://www.imgix.com/) and ImageProxy.

## Using this image

```
docker run docker.pkg.github.com/kuetemeier/docker-hugo-jk/hugo-jk:latest version
```

## Merging features into official HUGO sources

When time has come, we will try to integrate the additional features into the official HUGO project. Some just need a
litte bit more polishing, some more time to evolve and some just simply more documentation. And then they may eventually find their way into the official branch (the decision to do so is beyond our control).

But for now... I need it to build my site with this features right now. And so can you. It's free.
