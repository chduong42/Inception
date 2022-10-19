FROM alpine:3.15.6

LABEL   maintainer="Kenny DUONG <chduong@student.42.fr>"

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client mariadb-common && rm -rf /var/cache/apk/*

COPY ./config/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh

CMD ["sh", "/tmp/run.sh"]