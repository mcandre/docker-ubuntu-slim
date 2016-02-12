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

## Debian/Ubuntu

```
$ sudo apt-get install docker.io build-essential
```

## RedHat/Fedora/CentOS

```
$ sudo yum install docker-io
```

## non-Linux

* [VirtualBox](https://www.virtualbox.org/)
* [Docker Toolbox](https://www.docker.com/toolbox)

### Mac OS X

* [Xcode](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
* [Homebrew](http://brew.sh/)
* [brew-cask](http://caskroom.io/)

```
$ brew cask install dockertoolbox
```

### Windows

* [Chocolatey](https://chocolatey.org/)

```
> chocolatey install virtualbox make
```

* [DockerToolbox-1.8.2c.exe](https://github.com/docker/toolbox/releases/download/v1.8.2c/DockerToolbox-1.8.2c.exe)
