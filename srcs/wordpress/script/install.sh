#!/bin/sh

WP_PATH='/var/www/html/wordpress'

set -e -x

mkdir -p "${WP_PATH}"
mkdir -p /var/log/php7

for file in access error; do
    touch "/var/log/php7/${file}.log"
    chmod 644 "/var/log/php7/${file}.log"
done

if ! wp core is-installed --path="${WP_PATH}" 2> /dev/null; then
    rm -rf "${WP_PATH:?}/*"

    wp core download --path="${WP_PATH}"

    cd "${WP_PATH}"

    wp config create \
        --dbname="${WP_DB_NAME}" \
        --dbuser="${WP_DB_USER}" \
        --dbpass="${WP_DB_PWD}" \
        --dbhost="inception_mariadb" \
        --debug
    wp db create
    wp core install \
        --url="chduong.42.fr/wordpress" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PWD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email
    wp user create \
        "${WP_USER}" \
        "${WP_EMAIL}" \
        --user_pass="${WP_PWD}" \
        --porcelain

    cd -
fi

exec php-fpm7 -R -F -y /etc/php7/php-fpm.conf
