#!/bin/bash

export PORT=6969
export DOMAIN=localhost
export API_PATH=$(pwd)/../api
export WEB_PATH=$(pwd)/../web
export ADMIN_PATH=$(pwd)/../admin

# systemd api service
envsubst < chiefsend.service > /etc/systemd/system/chiefsend.service
systemctl daemon-reload

# nginx config
read -p "Use HTTPS (Y/n)?" choice
case "$choice" in 
  y|Y ) envsubst < chiefsend_https.conf > /etc/nginx/sites-available/chiefsend.conf;;
  n|N ) envsubst < chiefsend_http.conf > /etc/nginx/sites-available/chiefsend.conf;;
  * ) echo "invalid";;
esac

ln -f -s /etc/nginx/sites-available/chiefsend.conf /etc/nginx/sites-enabled/chiefsend.conf
systemctl restart nginx
