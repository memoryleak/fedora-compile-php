#!/bin/bash
./configure \
--prefix=/usr/local/php/7.3 \
--bindir=/usr/local/bin \
--sbindir=/usr/local/sbin \
--libexecdir=/usr/local/libexec/php/7.3 \
--sysconfdir=/usr/local/etc/php/7.3 \
--sharedstatedir=/usr/local/com/php/7.3 \
--localstatedir=/usr/local/var/php/7.3 \
--libdir=/usr/local/lib/php/7.3 \
--includedir=/usr/local/include/php/7.3 \
--datarootdir=/usr/local/share/php/7.3 \
--with-config-file-path=/usr/local/etc/php/7.3/php.ini \
--with-config-file-scan-dir=/usr/local/etc/php/7.3/conf.d \
--program-suffix=73 \
--enable-bcmath \
--enable-calendar \
--enable-exif \
--enable-fpm \
--enable-intl \
--enable-mbstring \
--enable-mysqlnd \
--enable-pcntl \
--enable-soap \
--enable-sockets \
--with-bz2 \
--with-curl \
--with-enchant \
--with-fpm-group=php \
--with-fpm-systemd \
--with-fpm-user=php \
--with-gd \
--with-gettext \
--with-gmp \
--with-kerberos \
--with-mhash \
--with-mysqli \
--with-openssl \
--with-pcre-regex \
--with-pdo-mysql \
--with-pdo-pgsql \
--with-pear \
--with-pgsql \
--with-readline \
--with-recode \
--with-sodium \
--with-xmlrpc \
--with-xsl \
--with-zlib
make clean
make -j
sudo make install
sudo cp php.ini-* /usr/local/etc/php/7.3/
sudo cp php.ini-development /usr/local/etc/php/7.3/php.ini
sed -i sapi/fpm/www.conf -e 's/127.0.0.1:9000/\/usr\/local\/var\/php\/7.3\/run\/php-fpm73.sock/g'
sudo cp sapi/fpm/www.conf /usr/local/etc/php/7.3/php-fpm.d/
sed -i sapi/fpm/php-fpm.service -e 's/php-fpm /php-fpm73 /g'
sed -i sapi/fpm/php-fpm.service -e 's/ProtectSystem=full/ProtectSystem=false/g'
sudo cp sapi/fpm/php-fpm.service /usr/lib/systemd/system/php-fpm73.service
sudo chown -R php:php /usr/local/var/php 