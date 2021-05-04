#!/usr/bin/env bash
PHP_VERSION="$1"
PHP_SUFFIX="${PHP_VERSION//[!0-9]/}"
PHP_EXECUTABLES="php php-cgi php-config phpdbg phpize"
PHP_SCRIPTS="pear peardev pecl"

if [ -z "$HOME" ]; then 
	echo "Could not parse home directory from \$HOME."
	exit -2	
fi

if [ "$#" -ne 1 ]; then
    echo "Please provide version, for example 7.3."
    exit -1
fi

if [[ ! -d "$HOME/.local/bin" ]]
then
    mkdir -p $HOME/.local/bin
fi

for PHP_EXECUTABLE in $PHP_EXECUTABLES; do
	ln -fsT "/usr/local/bin/php${PHP_SUFFIX}" "$HOME/.local/bin/$PHP_EXECUTABLE"
done


for PHP_SCRIPT in $PHP_SCRIPTS; do
	ln -fsT "/usr/local/bin/$PHP_SCRIPT${PHP_SUFFIX}" "$HOME/.local/bin/$PHP_SCRIPT"
done

ln -fsT "/usr/local/bin/phar73.phar" "$HOME/.local/bin/phar"
ls -las "$HOME/.local/bin/"

echo "Install xdebug..."

sudo php73 /usr/local/php/7.3/lib/php/peclcmd.php channel-update pecl.php.net
sudo php74 /usr/local/php/7.4/lib/php/peclcmd.php channel-update pecl.php.net
sudo php80 /usr/local/php/8.0/lib/php/peclcmd.php channel-update pecl.php.net
sudo php73 /usr/local/php/7.3/lib/php/peclcmd.php install xdebug
sudo php74 /usr/local/php/7.4/lib/php/peclcmd.php install xdebug
sudo php80 /usr/local/php/8.0/lib/php/peclcmd.php install xdebug

sudo cp /mnt/netinstall/files/work/php/php73/php.d/15-xdebug.ini /usr/local/php/7.3/etc/conf.d
sudo cp /mnt/netinstall/files/work/php/php73/php.d/10-opcache.ini /usr/local/php/7.3/etc/conf.d
sudo cp /mnt/netinstall/files/work/php/php73/php.d/15-xdebug.ini /usr/local/php/7.4/etc/conf.d
sudo cp /mnt/netinstall/files/work/php/php73/php.d/10-opcache.ini /usr/local/php/7.4/etc/conf.d
sudo cp /mnt/netinstall/files/work/php/php73/php.d/15-xdebug.ini /usr/local/php/8.0/etc/conf.d
sudo cp /mnt/netinstall/files/work/php/php73/php.d/10-opcache.ini /usr/local/php/8.0/etc/conf.d
