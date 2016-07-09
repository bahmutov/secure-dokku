#!/usr/bin/env bash

# Making fresh Dokku install more secure
# read https://glebbahmutov.com/blog/running-multiple-applications-in-dokku/

# copy / make this file on fresh Dokku installation and run
# chmod a+x secure-dokku.sh
# ./secure-dokku.sh

# from http://www.davidpashley.com/articles/writing-robust-shell-scripts/
# exit on error
set -e
# error on uninitialised variable
set -u

openssl dhparam -out /etc/nginx/conf.d/dhparams.pem 2048

cat <<EOT > /etc/nginx/conf.d/dokku.conf
include /home/dokku/*/nginx.conf;

server_tokens off;

ssl_session_cache shared:SSL:20m;
ssl_session_timeout 10m;

ssl_prefer_server_ciphers on;

# default ciphers
# ssl_ciphers EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;

# strong ciphers only
# see https://weakdh.org/sysadmin.html
ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:!CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';

ssl_dhparam /etc/nginx/conf.d/dhparams.pem;

# no SSLv3
ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

EOT

service nginx reload

# if reload fails, look at the error log
# cat /var/log/nginx/error.log
