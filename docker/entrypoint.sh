#!/bin/bash

cd /var/www/html

php artisan storage:link 2>/dev/null || true
php artisan migrate --force 2>/dev/null || true

export PORT=${PORT:-8080}

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
