touch tmp_mdb
chmod 755 tmp_mdb

if [ -d /var/lib/mysql/mysql ]; then
	echo "Already set up, starting..."
	exec /usr/bin/mysqld --user=mysql --console $@
	exit 1
fi

echo "Installing..."
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --auth-root-authentication-method=normal --basedir=/usr --datadir=/var/lib/mysql --skip-test-db --user=mysql

cat << break > tmp_mdb
CREATE DATABASE IF NOT EXISTS wordpress;
DELETE FROM mysql.user WHERE User = 'root';
USE wordpress;
FLUSH PRIVILEGES;
CREATE USER 'chduong'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL ON *.* TO 'chduong'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
SET PASSWORD FOR 'chduong'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT GRANT OPTION ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
break

/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp_mdb

rm -f tmp_mdb

exec /usr/bin/mysqld --user=mysql --console $@