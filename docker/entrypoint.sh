#!/bin/bash

cd /var/www/html

php artisan storage:link 2>/dev/null || true
php artisan migrate --force 2>/dev/null || true

sed -i "s/listen 8080/listen ${PORT:-8080}/" /etc/nginx/sites-available/default

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
