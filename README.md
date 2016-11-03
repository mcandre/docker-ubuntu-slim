# docker-ubuntu-slim - slim Docker base images for Ubuntu

# ABOUT

docker-ubuntu-slim is a collection of slim [debootstrap](https://wiki.debian.org/Debootstrap)-generated Ubuntu base images, made smaller with a few techniques:

* Use debootstrap minbase variant
* Clean leftover package manager files
* Clean leftover log files

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-ubuntu-slim/

# EXAMPLE

```
$ make
docker images | grep 'docker-ubuntu-slim.*latest' | awk '{ print $(NF-1), $NF }'
117.1 MB
```

# REQUIREMENTS

* [Docker](https://www.docker.com/)

## Optional

* [make](http://www.gnu.org/software/make/)
* [Node.js](https://nodejs.org/en/) (for dockerlint)
