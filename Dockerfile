FROM php:7.3-cli

LABEL maintainer="João Pedro Benedetti Misturini <joao.benedetti.misturini@gmail.com>"

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
