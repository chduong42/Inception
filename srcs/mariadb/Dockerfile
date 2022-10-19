FROM	debian:buster

# network port
EXPOSE 3306

# update packages and install mariadb ~
RUN		apt-get update -y && apt-get install -y mariadb-server mariadb-client

# adding my config file to my containe
COPY	config/server.cnf /etc/mysql/mariadb.conf.d/server.cnf

RUN 	mkdir -p /var/run/mysqld/ /run/mysqld/ && \
        chown -R mysql:root /run/mysqld

COPY 	config/script.sh /var/

RUN     chmod -R 755 /var/lib/mysql
RUN     chmod 755 /var/script.sh

CMD 	["sh", "/var/script.sh"]  
