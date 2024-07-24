FROM php:8.3-cli

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp

RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/download/1.2.0/datadog-setup.php \
  && php datadog-setup.php --php-bin=all

CMD [ "bash" ]
