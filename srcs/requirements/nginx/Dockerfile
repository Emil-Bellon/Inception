FROM debian:buster

# Set up port forwarding
EXPOSE 443

# Install base components
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install nginx
RUN apt-get -y install openssl

# Create certificate
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Lyon/O=42/OU=42/CN=ebellon" -newkey rsa:4096 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# Copy nginx config
COPY ./conf/default etc/nginx/sites-enabled/default

# Run nginx
CMD ["nginx", "-g", "daemon off;"]