FROM debian:buster

# Install base components
RUN apt-get update && apt-get upgrade -y && apt-get -y install nginx openssl

# Create certificate
RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=ebellon.42.fr/emailAddress=ebellon@student.42lyon.fr" \
	-keyout /etc/nginx/ssl/ebellon.42.fr.key -out /etc/nginx/ssl/ebellon.42.fr.crt

# Copy nginx config
COPY ./conf/default etc/nginx/sites-available/default

# Run nginx
CMD ["nginx", "-g", "daemon off;"]