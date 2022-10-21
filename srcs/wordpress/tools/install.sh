#!/bin/sh

wp config create \
    --dbname="${WP_DB_NAME}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_PASSWORD}" \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

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

exec /usr/sbin/php-fpm8 -R -F -y /etc/php7/php-fpm.conf