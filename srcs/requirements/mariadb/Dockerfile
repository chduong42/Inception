FROM debian:buster

LABEL version="1.0"
LABEL maintainer="Kenny DUONG <chduong@student.42.fr>"
LABEL description="MariaDB Server"

RUN apt-get update && apt-get install -y mariadb-server mariadb-client gettext-base

COPY ./config/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY ./config/script.sh /var/.
COPY ./config/init.sql /var/.

CMD ["sh", "/var/script.sh" ]