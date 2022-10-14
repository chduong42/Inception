FROM alpine:3.15.6

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="MariaDB Server"

COPY script/run.sh /tmp/run.sh
COPY script/install.sh /tmp/install.sh

RUN apk -U upgrade && apk add --no-cache mariadb mariadb-client

ENTRYPOINT [ "sh", "/tmp/run.sh" ]