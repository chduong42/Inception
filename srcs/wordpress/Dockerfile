FROM alpine:3.15.6

LABEL maintainer="Kenny DUONG <chduong@student.42.fr>"

EXPOSE 9000

RUN apk update && apk upgrade && apk add --no-cache wget php7 php7-fpm php7-opcache php7-mysqli mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/php-fpm.conf /etc/php7/php-fpm.conf

ENTRYPOINT [ "sh", "/tmp/install.sh" ]