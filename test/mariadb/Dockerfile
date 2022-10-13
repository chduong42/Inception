FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

RUN apk -U upgrade && apk add --no-cache mariadb mariadb-client gettext-base

COPY config/script.sh /var/script.sh

CMD ["sh", "/var/script.sh" ]