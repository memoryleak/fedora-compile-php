#!/usr/bin/env bash
dnf groupinstall -y c-development
dnf install -y \
	systemd-devel \
	libxml2-devel \
	openssl-devel \
	bzip2-devel \
	curl-devel \
	enchant-devel \
	libwebp-devel \
	libjpeg-devel \
	libpng-devel \
	gmp-devel \
	libicu-devel \
	libpq-devel \
	readline-devel \
	recode-devel \
	libsodium-devel \
	libxslt-devel \
	krb5-devel \
	sqlite-devel \
	oniguruma-devel \
	libzip-devel \
	libXpm-devel \
	freetype-devel \
	enchant2-devel \
	openldap-devel \
	libedit-devel \
	mm-devel \
	re2c