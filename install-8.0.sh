#!/bin/bash
make clean
./configure \
--prefix=/usr/local/php/8.0 \
--bindir=/usr/local/bin \
--sbindir=/usr/local/sbin \
--libexecdir=/usr/local/libexec/php/8.0 \
--sysconfdir=/usr/local/etc/php/8.0 \
--sharedstatedir=/usr/local/com/php/8.0 \
--localstatedir=/usr/local/var/php/8.0 \
--libdir=/usr/local/lib/php/8.0 \
--includedir=/usr/local/include/php/8.0 \
--datarootdir=/usr/local/share/php/8.0 \
--program-suffix=80 \
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
--with-gettext \
--with-gmp \
--with-kerberos \
--with-mhash \
--with-mysqli \
--with-openssl \
--with-pdo-mysql \
--with-pdo-pgsql \
--with-pear \
--with-pgsql \
--with-readline \
--with-sodium \
--with-xsl \
--with-zlib
make clean
make -j
sudo make install
sudo cp php.ini-* /usr/local/etc/php/8.0/
sudo cp sapi/fpm/php-fpm.service /usr/lib/systemd/system/php-fpm80.service
sudo cp sapi/fpm/php-fpm.conf /usr/local/etc/php/8.0/php-fpm.conf