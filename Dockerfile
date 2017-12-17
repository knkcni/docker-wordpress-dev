FROM ubuntu:16.04

ENV TERM xterm-256color
ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y apt-utils \
        apache2 \
        php \
        libapache2-mod-php \
        php-mysql \
        php-zip \
        php-gd \
        php-xml \
        php-intl \
        php-mcrypt \ 
        php-curl \
        php-mbstring \
        mysql-client \
        git \
        zip \
        unzip \ 
        vim \
        man \
        supervisor \
        nodejs \
        npm \
        netcat

# Combined VHOST logs
RUN sed -i '/LogFormat "%h %l %u %t \\\"%r\\\" %>s %O \\\"%{Referer}i\\\" \\\"%{User-Agent}i\\\"" combined/s/%h/%{X-Forwarded-For}i/' /etc/apache2/apache2.conf

RUN a2enmod rewrite

WORKDIR /var/www

RUN rm -Rf /var/www/*

COPY . /var/www

RUN chown -R www-data:www-data /var/www
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/supervisor

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/000-default.conf /etc/apache2/sites-available/000-default.conf


WORKDIR /var/www

EXPOSE 80

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf