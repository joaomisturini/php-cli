FROM php:7.3-cli

ARG USER_UID=1000
ARG USER_GID=1000
ARG USERNAME=myuser

RUN apt-get update && apt-get install -y --no-install-recommends git zip unzip libzip-dev

RUN groupadd --gid $USER_GID $USERNAME && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt-get install -y sudo && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN docker-php-ext-install -j"$(nproc)" zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
