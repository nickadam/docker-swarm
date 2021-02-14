FROM redis:6 AS redis

FROM php:8-apache

COPY --from=redis /usr/local/bin/redis-cli /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/

COPY index.php /var/www/html/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["apache2-foreground"]
