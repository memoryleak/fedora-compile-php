#!/bin/bash
make clean
./configure \
--prefix=/usr/local/php/7.4 \
--bindir=/usr/local/bin \
--sbindir=/usr/local/sbin \
--libexecdir=/usr/local/libexec/php/7.4 \
--sysconfdir=/usr/local/etc/php/7.4 \
--sharedstatedir=/usr/local/com/php/7.4 \
--localstatedir=/usr/local/var/php/7.4 \
--libdir=/usr/local/lib/php/7.4 \
--includedir=/usr/local/include/php/7.4 \
--datarootdir=/usr/local/share/php/7.4 \
--program-suffix=74 \
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
--with-xmlrpc \
--with-xsl \
--with-zlib
make clean
make -j
sudo make install
cp php.ini-* /usr/local/etc/php/7.4/
cp sapi/fpm/php-fpm.service /usr/lib/systemd/system/php-fpm74.service
cp sapi/fpm/php-fpm.conf /usr/local/etc/php/7.4/php-fpm.conf