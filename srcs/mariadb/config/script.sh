#!/bin/sh

# This script is made to install MariaDB default databases and users.
# It only exists because Docker volumes are mounted at runtime, not
# when building the container.

# Options
#	--auth-root-authentication-method=normal
#		force root the authenticate with a password
#
#	--basedir=/usr
#		where mysql will be installed (mainly for `bin` and `lib`)
#
#	--datadir=/var/lib/mysql
#		where mysql data will be stored (useful when mounting docker volumes)
#
#	--skip-test-db
#		avoid creating test database and anonymous user
#
#	--user=mysql
#		system user account which will be used to perform the installation
#
# see https://mariadb.com/kb/en/mysql_install_db/#options
#
MYSQL_INSTALL_OPT="
    --auth-root-authentication-method=normal
    --user=mysql
    --basedir=/usr
    --datadir=/var/lib/mysql
    --skip-test-db
"
set -xe

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chown mysql:mysql /run/mysqld
fi

printf -- "Installing MariaDB\n"
if [ -d /var/lib/mysql/mysql ]; then
    printf -- "MariaDB already installed, skipping\n"
else
    mariadb-install-db ${MYSQL_INSTALL_OPT}
    # initialize mariadb 'offline' (without a running daemon)
    {
        # Create ${DB_NAME}
        CREATE DATABASE IF NOT EXISTS ${DB_NAME};
        # Create new user wordpress
        CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED by '${WP_PASSWORD}';
        # Give access to all database wordpress to the user 'wordpress'
        GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'wordpress'@'%' WITH GRANT OPTION;
        # Set up root password
        SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${ROOT_PWD}');
        FLUSH PRIVILEGES;
    } | mariadbd --user=mysql --bootstrap
fi

# delete default configs
# ':' means 'do nothing'
: > /etc/my.cnf
rm -rf /etc/my.cnf.d/*

# replace the current shell process with the mysql server :
#	--bind-address=0.0.0.0
#		allow every address to connect
#	--disable-skip-networking
#		tell mariadb to listen for network connections
#	-u mysql
#		the system user account who will run the server,
#		mandatory when running as root
#	-v
#		more information logging
exec mariadbd --bind-address=0.0.0.0 --disable-skip-networking --user mysql --verbose