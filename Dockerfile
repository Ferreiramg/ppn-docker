FROM php:7.4-fpm

RUN apt-get update && apt-get install -y libpq-dev
#Install xdebug
RUN yes | pecl install xdebug && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& echo "xdebug.discover_client_host=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log=/var/www/html/storage/logs/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini 

#ext postgress
RUN docker-php-ext-install pdo pdo_pgsql

WORKDIR /var/www/html

CMD ["php-fpm"]