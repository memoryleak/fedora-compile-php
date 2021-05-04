#!/usr/bin/env bash
PHP_VERSIONS="7.3.28 7.4.18 8.0.5"

echo "Clean up existing files..."

rm -rf src/ && mkdir -p src

echo "Installing dependencies (using sudo)..."
sudo ./install-deps.sh

for PHP_VERSION in $PHP_VERSIONS; do
	PHP_VERSION_SHORT=$(echo $PHP_VERSION | cut -c1-3)
	echo "Downloading $PHP_VERSION..."
	curl -s https://www.php.net/distributions/php-$PHP_VERSION.tar.xz -o php-$PHP_VERSION.tar.xz
	tar -xf php-$PHP_VERSION.tar.xz -C src/ && rm php-$PHP_VERSION.tar.xz
	echo "Installing $PHP_VERSION..."
	(cd "src/php-$PHP_VERSION" && ./../../install-$PHP_VERSION_SHORT.sh)

done

echo "Install PHP version switcher (switch-php-version)..."
mkdir -p "$HOME/.local/bin" && cp switch-php-version.sh "$HOME/.local/bin/switch-php-version"

echo "Install xdebug..."

sudo php73 /usr/local/php/7.3/lib/php/peclcmd.php channel-update pecl.php.net
sudo php74 /usr/local/php/7.4/lib/php/peclcmd.php channel-update pecl.php.net
sudo php80 /usr/local/php/8.0/lib/php/peclcmd.php channel-update pecl.php.net
sudo php73 /usr/local/php/7.3/lib/php/peclcmd.php install xdebug
sudo php74 /usr/local/php/7.4/lib/php/peclcmd.php install xdebug
sudo php80 /usr/local/php/8.0/lib/php/peclcmd.php install xdebug

echo "Copy module configurations..."

sudo cp conf.d/* /usr/local/php/7.3/etc/conf.d
sudo cp conf.d/* /usr/local/php/7.4/etc/conf.d
sudo cp conf.d/* /usr/local/php/8.0/etc/conf.d

echo "Add PHP group and user"
sudo groupadd -r php-fpm
sudo useradd -r -g php-fpm php-fpm
sudo systemctl daemon-reload