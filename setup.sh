#!/bin/bash
PHP_73_VERSION="7.3.28"
PHP_74_VERSION="7.4.18"
PHP_80_VERSION="8.0.5"

rm -rf php-$PHP_73_VERSION.tar.xz php-$PHP_73_VERSION
rm -rf php-$PHP_74_VERSION.tar.xz php-$PHP_74_VERSION
rm -rf php-$PHP_80_VERSION.tar.xz php-$PHP_80_VERSION

echo "Downloading $PHP_73_VERSION..."
curl -s https://www.php.net/distributions/php-$PHP_73_VERSION.tar.xz -o php-$PHP_73_VERSION.tar.xz
echo "Downloading $PHP_74_VERSION..."
curl -s https://www.php.net/distributions/php-$PHP_74_VERSION.tar.xz -o php-$PHP_74_VERSION.tar.xz
echo "Downloading $PHP_80_VERSION..."
curl -s https://www.php.net/distributions/php-$PHP_80_VERSION.tar.xz -o php-$PHP_80_VERSION.tar.xz

mkdir -p src

echo "Extracting $PHP_73_VERSION..."
tar -xf php-$PHP_73_VERSION.tar.xz -C src/ && rm php-$PHP_73_VERSION.tar.xz
echo "Extracting $PHP_74_VERSION..."
tar -xf php-$PHP_74_VERSION.tar.xz -C src/ && rm php-$PHP_74_VERSION.tar.xz
echo "Extracting $PHP_80_VERSION..."
tar -xf php-$PHP_80_VERSION.tar.xz -C src/ && rm php-$PHP_80_VERSION.tar.xz

echo "Installing dependencies (using sudo)..."
sudo ./install-deps.sh

echo "Installing $PHP_73_VERSION..."
(cd "src/php-$PHP_73_VERSION" && ./../../install-7.3.sh)

echo "Installing $PHP_74_VERSION..."
(cd "src/php-$PHP_74_VERSION" && ./../../install-7.4.sh)

echo "Installing $PHP_80_VERSION..."
(cd "src/php-$PHP_80_VERSION" && ./../../install-8.0.sh)

echo "Install PHP version switcher (switch-php-version)..."
mkdir -p "$HOME/.local/bin" && cp switch-php-version.sh "$HOME/.local/bin/switch-php-version"
