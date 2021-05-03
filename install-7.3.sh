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
cp sudo php.ini-* /usr/local/etc/php/7.3/
cp sudo sapi/fpm/php-fpm.service /usr/lib/systemd/system/php-fpm73.service
cp sudo sapi/fpm/php-fpm.conf /usr/local/etc/php/7.3/php-fpm.conf