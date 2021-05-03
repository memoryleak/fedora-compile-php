#!/bin/bash
curl https://www.php.net/distributions/php-7.3.28.tar.xz > -o php-7.3.xz
curl https://www.php.net/distributions/php-7.4.18.tar.xz > -o php-7.4.xz
curl https://www.php.net/distributions/php-8.0.5.tar.xz > -o php-8.0.tar.xz
tar -xf php-7.3.xz
tar -xf php-7.4.xz
tar -xf php-8.0.tar.xz
