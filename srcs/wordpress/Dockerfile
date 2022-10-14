FROM alpine:3.16

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="WordPress"

EXPOSE 9000

RUN apk update && apk upgrade && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

# Copy the .conf in the html directory
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start
RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

#We go the html directory
WORKDIR /var/www/html/

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm7.3", "-F"]