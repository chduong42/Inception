FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

COPY script/install.sh /var/install.sh

RUN apk --update add --no-cache mariadb mariadb-common mariadb-client 

ENTRYPOINT ["sh", "/var/script.sh" ]