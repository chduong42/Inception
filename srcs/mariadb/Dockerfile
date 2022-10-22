FROM alpine:3.15.6

LABEL   maintainer="Kenny DUONG <chduong@student.42.fr>"

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client mariadb-common

COPY config/my.cnf /etc/my.cnf.d/

RUN mkdir -p /run/mysqld/ && chown -R mysql:mysql /run/mysqld

COPY tools/install.sh /tmp/install.sh

ENTRYPOINT ["sh", "/tmp/install.sh"]