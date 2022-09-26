FROM debian:buster

RUN apt update && apt install -y mariadb-server mariadb-client gettext-base

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

EXPOSE 3306

COPY config/script.sh /var/script.sh

CMD ["sh", "/var/script.sh" ]