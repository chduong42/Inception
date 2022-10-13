FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

RUN apk update && apk add --no-cache mariadb mariadb-client \
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

#Allow to run the daemon of mysql
# Purge and re-create /var/lib/mysql with appropriate ownership
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY config/script.sh /var/script.sh

ENTRYPOINT ["sh", "/var/script.sh" ]