FROM alpine:3.16

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="WordPress"

EXPOSE 9000

RUN apk update && apk upgrade && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl

