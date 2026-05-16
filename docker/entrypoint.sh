#!/bin/bash
set -e

cd /var/www/html

php artisan storage:link 2>/dev/null || true
php artisan vendor:publish --tag=mixpost-migrations --force 2>/dev/null || true
php artisan migrate --force 2>&1

sed -i "s/listen 8080/listen ${PORT:-8080}/" /etc/nginx/sites-available/default

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
