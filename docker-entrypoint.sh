#!/usr/bin/env bash

if [ "$1" = 'php-fpm' ]; then
  if [ -e fpm-before.sh ]; then
    /usr/bin/env bash fpm-before.sh
  fi
  exec "$@"
else
  exec php "$@"
fi
