FROM php:7.2-fpm

MAINTAINER Tunahan ÇALIŞKAN <mail@tunahancaliskan.com.tr>

RUN apt-get update && \
    apt-get install -y libmcrypt-dev libicu-dev mysql-client zlib1g-dev libpng-dev && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install iconv && \
    docker-php-ext-install intl && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-ext-install gd

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /var/www/html

CMD ["php-fpm"]
