FROM php:7.4-fpm
RUN apt-get update && \
    apt-get install -y \
    nginx \
    curl \
    vim \
    sudo \
    supervisor

WORKDIR /var/www/html
COPY /jaat/index.php /var/www/html/index.php
COPY /jaat/default.conf /etc/nginx/sites-enabled/default
COPY /jaat/supervisord.conf /etc/supervisor/conf.d/supervisor.conf
CMD ["/usr/bin/supervisord"]