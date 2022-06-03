FROM debian:buster

# Set up port forwarding
EXPOSE 3306

# Set up global env variables (usable in dockerfile)
ARG DB_ROOT_PASSWORD
ARG DB_DATABASE
ARG DB_USER
ARG DB_PASSWORD

# Install base components
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

# Copy mariadb conf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy SQL database creation script
COPY conf/db.sql /

# Replace database name (DB_DATABASE), database user (DB_USER) and database password (DB_PASSWORD) in SQL script
RUN sed -i "s/DB_DATABASE/$DB_DATABASE/g" /db.sql
RUN sed -i "s/DB_USER/$DB_USER/g" /db.sql
RUN sed -i "s/DB_PASSWORD/$DB_PASSWORD/g" /db.sql

# Run MYSQL and inject SQL script
RUN service mysql start && mysql < db.sql

RUN rm -f db.sql

CMD ["mysqld"]