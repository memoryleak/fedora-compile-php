#!/usr/bin/env bash
PHP_VERSION="8.0"
PHP_SUFFIX="80"

./configure \
--prefix=/usr/local/php/$PHP_VERSION \
--exec-prefix=/usr/local/php/$PHP_VERSION \
--bindir=/usr/local/bin \
--sbindir=/usr/local/sbin \
--with-config-file-path="/usr/local/php/$PHP_VERSION/etc/php.ini" \
--with-config-file-scan-dir="/usr/local/php/$PHP_VERSION/etc/conf.d" \
--program-suffix=$PHP_SUFFIX \
--with-fpm-group=php-fpm \
--with-fpm-user=php-fpm \
--with-fpm-systemd \
--disable-cgi \
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
--with-fpm-group=php-fpm \
--with-fpm-systemd \
--with-fpm-user=php-fpm \
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

# Create additional folders
sudo mkdir -p \
	/usr/local/php/$PHP_VERSION/etc/conf.d

# Copy additional files
sudo cp php.ini-* \
	/usr/local/php/$PHP_VERSION/etc/

sudo cp php.ini-development \
	/usr/local/php/$PHP_VERSION/etc/php.ini

sudo cp sapi/fpm/php-fpm.conf \
	/usr/local/php/$PHP_VERSION/etc/

# Set correct socket location and copy www.conf
sed -i sapi/fpm/www.conf -e "s/127.0.0.1:9000/\/usr\/local\/php\/$PHP_VERSION\/var\/run\/php-fpm.sock/g"
sudo cp sapi/fpm/www.conf \
	/usr/local/php/$PHP_VERSION/etc/php-fpm.d/

sed -i sapi/fpm/php-fpm.service -e "s/php-fpm /php-fpm$PHP_SUFFIX /g"
sed -i sapi/fpm/php-fpm.service -e "s/ProtectSystem=full/ProtectSystem=false/g"

sudo cp sapi/fpm/php-fpm.service \
	 /usr/lib/systemd/system/php-fpm$PHP_SUFFIX.service

sudo mv /usr/local/bin/pear /usr/local/bin/pear$PHP_SUFFIX
sudo mv /usr/local/bin/peardev /usr/local/bin/peardev$PHP_SUFFIX
sudo mv /usr/local/bin/pecl /usr/local/bin/pecl$PHP_SUFFIX
sudo mv /usr/local/bin/phar /usr/local/bin/phar$PHP_SUFFIX
sudo mv /usr/local/bin/phar.phar /usr/local/bin/phar$PHP_SUFFIX.phar