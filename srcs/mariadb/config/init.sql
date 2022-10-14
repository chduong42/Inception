-- Add password to root user
ALTER USER root@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${ROOT_PWD}');
-- Create ${DB_NAME}
CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
-- Create new user wordpress
CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED by '${WP_DB_PWD}';
-- Give access to all database wordpress to the user 'wordpress'
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;