# PHP CLI

Docker image for replacing a PHP installation on Ubuntu.

## Instructions

1. Build this Dockerfile into an image:

```
$ docker build -t <your-image-name> .
```

2. On your computer, add your aliases to map `php` to docker run:

```
alias php='docker run --rm -it -v ${PWD}:/var/www/html -w /var/www/html <your-image-name> php'

alias composer='docker run --rm -it -v ${PWD}:/var/www/html -w /var/www/html <your-image-name> composer'
```
