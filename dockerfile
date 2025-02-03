# Dockerfile - Ubuntu update, Apache2 install and run Apache on start

# Base Platform
FROM ubuntu

# Work directory on the container
WORKDIR /app

# Execute commands
RUN apt-get update && \
apt-get install apache2 -y 

COPY images /var/www/html/
COPY styles /var/www/html/
COPY index.html /var/www/html/
  
ENTRYPOINT apachectl -D FOREGROUND 
EXPOSE 80
