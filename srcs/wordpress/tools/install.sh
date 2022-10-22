#!/bin/sh

#Wait mariadb launched
sleep 6

set -x

cd /var/www/wordpress

if [ -f /var/www/wordpress/wp-config.php ]; then
    echo "Already created"
    exec /usr/sbin/php-fpm7 -F
    exit 1
fi

# wp core download --path="/var/www/wordpress"
wp config create --allow-root \
    --dbname="${WP_DB_NAME}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_PASSWORD}" \
    --dbhost=mariadb:3306 \
    --path='/var/www/wordpress'
wp db create
wp core install \
    --url="chduong.42.fr" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_ADMIN_NAME}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --skip-email
wp user create "${WP_USER_NAME}" "${WP_USER_EMAIL}" \
    --user_pass="${WP_USER_PASSWORD}" \
    --porcelain

mkdir -p /run/php

exec /usr/sbin/php-fpm7 -F