# FROM alpine:3.15.6

# RUN apk --update add --no-cache mariadb mariadb-common mariadb-client 

FROM debian:buster

RUN apt update -y && apt install mariadb-server mariadb-client gettext-base -y

COPY ./config/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY ./config/script.sh /var/.
COPY ./config/init.sql /var/.

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

ENTRYPOINT ["sh", "/var/script.sh" ]