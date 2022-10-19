FROM alpine:3.15.6

LABEL   maintainer="Kenny DUONG <chduong@student.42.fr>"

RUN apk update && apk upgrade && \
	apk add --no-cache mariadb mariadb-client mariadb-common openrc && \
	/etc/init.d/mariadb setup && \
	rc-service mariadb start && rc-update add mariadb default

COPY my.cnf /etc/my.cnf

ENTRYPOINT ["mysqld", "--user=root"]