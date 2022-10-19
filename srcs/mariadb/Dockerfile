FROM alpine:3.15.6

EXPOSE 3306

# Install dependencie
RUN apk update && apk add --no-cache mariadb mariadb-common mariadb-client

COPY config/my.cnf /etc/my.cnf

# Create requiered directories and socket file
RUN mkdir -p /etc/mysql/mariadb.conf.d/;
RUN mkdir -p /etc/mysql/conf.d/;
RUN mkdir -p /run/mysqld/;
RUN touch /run/mysqld/mysqld.sock;

ENTRYPOINT ["mysqld", "--user=root"]