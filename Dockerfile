FROM httpd:alpine3.20

RUN apk update && apk add --no-cache \
        openssh \
        openssh-server \
        php83 \
        php83-fpm \
        php83-curl \
        php83-intl \
        php83-mysqli \
        php83-openssl \
        php83-pdo_mysql \
        php83-simplexml \
        php83-common \
        php83-xmlreader \
        php83-xmlwriter \
        php83-fileinfo \
        php83-exif \
        php83-ldap \
        php83-dom \
        php83-gd \
        php83-iconv \
        php83-session \
        php83-xml \
        wget \
        tar \
        shadow \
        supervisor

EXPOSE 80 2222

WORKDIR /

RUN wget 'https://github.com/glpi-project/glpi/releases/download/10.0.15/glpi-10.0.15.tgz' \
    && tar xvzf glpi-10.0.15.tgz -C /usr/local/apache2/htdocs
RUN rm /glpi-10.0.15.tgz    

COPY apache/httpd.conf.final /usr/local/apache2/conf/httpd.conf
COPY apache/fpm-www.conf /etc/php83/php-fpm.d/www.conf
COPY php/php.ini /etc/php83/
COPY sshd/sshd_config /etc/ssh/sshd_config
COPY supervisor /etc/supervisor

RUN adduser -s /bin/ash -g root -u 1000 -D admin

ARG PASSWORD

RUN echo "admin:${PASSWORD}" | chpasswd

RUN ssh-keygen -A 

CMD ["supervisord","-n", "-c", "/etc/supervisor/supervisord.conf"]