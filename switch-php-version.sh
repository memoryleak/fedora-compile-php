#!/bin/bash
PHP_VERSION="$1"
PHP_SUFFIX="${PHP_VERSION//[!0-9]/}"
PHP_EXECUTABLES="php php-cgi php-config phpdbg phpize"

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

ls -las "$HOME/.local/bin/" | grep php