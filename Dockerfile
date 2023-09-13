FROM php:8.2-alpine AS app_composer

LABEL maintainer="Alexader S. <alexander@sharapov.biz>"

ENV COMPOSER_ALLOW_SUPERUSER 1

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY composer.json /srv

WORKDIR /srv

RUN composer install --no-interaction --no-scripts --no-dev

FROM php:8.2-fpm-alpine AS app_service

LABEL maintainer="Alexander S. <alexander@sharapov.biz>"

ENV TZ=UTC

RUN apk update && apk add libpq-dev tzdata

RUN echo -e "\
[global]\n\
error_log = /proc/self/fd/2\n\
[www]\n\
access.log = /proc/self/fd/2\n\
catch_workers_output = yes\n\
decorate_workers_output = no."\
>> /usr/local/etc/php-fpm.d/logging.conf

COPY --from=app_composer /srv/vendor /srv/vendor
COPY runner /srv

WORKDIR /srv

CMD ["php", "runner"]
