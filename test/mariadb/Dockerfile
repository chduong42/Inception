FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

RUN apk --update add --no-cache mariadb mariadb-common mariadb-client

COPY config/script.sh /var/script.sh

ENTRYPOINT ["sh", "/var/script.sh" ]