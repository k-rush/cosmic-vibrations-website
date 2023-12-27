FROM php:7.4-apache

# Set up workdir
ENV WORKDIR /var/www/html
ENV COMPOSER_ALLOW_SUPERUSER 1
WORKDIR $WORKDIR

# Install Dependencies
RUN apt-get update && apt-get install -y git-core zip

RUN git clone https://github.com/k-rush/cosmic-vibrations-website.git $WORKDIR

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN composer config --no-plugins allow-plugins.picocms/composer-installer true
RUN composer install

EXPOSE 80