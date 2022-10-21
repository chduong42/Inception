#!/bin/sh

set -e -x

WP_PATH='/var/www/html'
mkdir -p "${WP_PATH}"

if ! wp core is-installed --path="${WP_PATH}" 2> /dev/null; then
    rm -rf "${WP_PATH:?}/*"

    wp core download --path="${WP_PATH}"

    cd "${WP_PATH}"

    wp config create --allow-root \
        --dbname="${WP_DB_NAME}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost=mariadb:3306 \
        --debug
    wp db create
    wp core install \
        --url="chduong.42.fr" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_NAME}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email
    wp user create \
        "${WP_USER_NAME}" \
        "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}" \
        --porcelain

    cd -
fi

exec /usr/sbin/php-fpm7 -R -F -y /etc/php7/php-fpm.conf