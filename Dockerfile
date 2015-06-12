FROM tutum/lamp

WORKDIR /app
RUN apt-get update
RUN apt-get install -y wget php5-cli php5-dev php5-gd php5-pgsql php5-sqlite php5-mysqlnd php5-curl php5-intl php5-mcrypt php5-ldap php5-gmp php5-apcu php5-imagick php5-fpm smbclient liboauth-php php-pear libpcre3-dev
RUN pecl install -f oauth
RUN echo "extension=oauth.so" >> /etc/php5/apache2/php.ini
ADD apache_config /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN a2enmod ssl
RUN wget https://download.owncloud.org/community/owncloud-8.0.4.tar.bz2 -O /tmp/owncloud-8.0.4.tar.bz2
RUN cd /tmp && tar -xf owncloud-8.0.4.tar.bz2
RUN rm -Rf /app && cd /tmp && cp -r owncloud /app
ADD config.php /app/config/config.php

RUN chown -R www-data:www-data /app && chmod -R 775 /app

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/
ENV APACHE_LOCK_DIR /var/run/lock
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
