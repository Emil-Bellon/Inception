CREATE DATABASE DB_DATABASE;
ALTER USER 'root'@localhost IDENTIFIED BY 'rootpass';

CREATE USER 'DB_USER'@'%' IDENTIFIED BY 'DB_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO 'DB_USER'@'%';

FLUSH PRIVILEGES;