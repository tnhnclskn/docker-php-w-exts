FROM php:7.2-fpm

MAINTAINER Tunahan ÇALIŞKAN <mail@tunahancaliskan.com.tr>

RUN apt-get update && \
    apt-get install -y libmcrypt-dev libicu-dev mysql-client zlib1g-dev libpng-dev && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install iconv && \
    docker-php-ext-install intl && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-ext-install gd && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug

ARG user=phpfpm
ARG group=phpfpm
ARG uid=1000
ARG gid=1000
ARG WEB_HOME=/var/www/html

RUN mkdir -p $WEB_HOME && \
  chown ${uid}:${gid} $WEB_HOME && \
  groupadd -g ${gid} ${group} && \
  useradd -d "$WEB_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
USER ${user}

WORKDIR /var/www/html

CMD ["php-fpm"]
