FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

RUN     apk --update add --no-cache mariadb mariadb-common mariadb-client && \
        mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

COPY config/script.sh /var/script.sh

ENTRYPOINT ["sh", "/var/script.sh" ]