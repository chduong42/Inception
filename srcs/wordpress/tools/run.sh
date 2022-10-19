#!/bin/sh

# wait until database is ready
while ! mariadb -h$MYSQL_HOST -u$WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME --silent; do
	echo "[INFO] waiting for database..."
	sleep 1;
done

# check if wordpress is installed
if [ ! -f "/var/www/html/$WP_FILE_ONINSTALL" ]; then
	echo "[INFO] installing wordpress..."

	# wp-cli
	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD \
		--dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
	wp theme install ryu --activate --allow-root

	echo "[INFO] wordpress installation finished"
	touch /var/www/html/$WP_FILE_ONINSTALL
fi


echo "[INFO] starting php-fpm..."
mkdir -p /var/run/php-fpm7
php-fpm7 --nodaemonize