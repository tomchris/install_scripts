#!/bin/bash

if [ -z $1 ]; then
  echo "Domain to be configured required!!!"
fi

read -p "Are you sure you want to install Let's Encrypt for domain: $1 ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo add-apt-repository ppa:certbot/certbot
  sudo apt-get update && sudo apt-get install -y python-certbot-apache
  sudo certbot --apache -d $1
  sudo certbot renew --dry-run
fi


