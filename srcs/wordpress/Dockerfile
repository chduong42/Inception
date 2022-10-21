FROM alpine:3.15.6

LABEL maintainer="Kenny DUONG <chduong@student.42.fr>"

EXPOSE 9000

RUN apk update && apk upgrade && apk add --no-cache wget mariadb-client \
    php8 php8-fpm php8-opcache php8-gd php8-zlib php8-curl

RUN mkdir /var/run/php

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp/

COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY tools/install.sh /tmp/install.sh

ENTRYPOINT [ "sh", "/tmp/install.sh" ]