FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

RUN apk upgrade && apk add --no-cache mariadb mariadb-client

COPY tools/install.sh /tmp/install.sh

ENTRYPOINT [ "sh", "/tmp/install.sh" ]