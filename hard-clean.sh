#!/usr/bin/env bash
sudo find /usr/local/ -name "*php*"  -exec rm -rf {} \;
sudo rm -rf /usr/local/bin/*
sudo rm -rf /usr/lib/systemd/system/php-fpm*.service
sudo systemctl daemon-reload
sudo rm /root/.pearrc
