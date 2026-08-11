FROM php:8.5-apache
# Update and install packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nano bash libcurl4-openssl-dev libzip-dev libxml2-dev net-tools

# Install PHP extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync
RUN install-php-extensions pdo pdo_mysql curl zip bcmath calendar dom curl mbstring xml pdo_sqlite zip intl

# XDEBUG
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN touch "/var/log/apache2/xdebug.log"

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite

# Set up user folders and permissions

RUN groupadd --gid 1000 webuser \
    && useradd \
        --uid 1000 \
        --gid webuser \
        --create-home \
        --home-dir /home/webuser \
        --shell /bin/bash \
        webuser \
    && mkdir -p /home/webuser/.ssh \
    && chown -R webuser:webuser /home/webuser \
    && chmod 700 /home/webuser/.ssh

COPY --chown=webuser:webuser ssh/authorized_keys /home/webuser/.ssh/authorized_keys
RUN chmod 600 /home/webuser/.ssh/authorized_keys
# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"&& \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"&& \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" \

 #
 ## copy configs
 #
 # Apache2
 RM "/etc/apache2/sites-available/000-default.conf"
COPY .conf/apache2.conf "/etc/apache2/sites-available/000-default.conf"
COPY .conf/envvars "/etc/apache2/"
# Atlassian CLI
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates wget gnupg2 \
    && mkdir -p -m 755 /etc/apt/keyrings \
    && wget -nv -O- https://acli.atlassian.com/gpg/public-key.asc \
        | gpg --dearmor -o /etc/apt/keyrings/acli-archive-keyring.gpg \
    && chmod go+r /etc/apt/keyrings/acli-archive-keyring.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/acli-archive-keyring.gpg] https://acli.atlassian.com/linux/deb stable main" \
        > /etc/apt/sources.list.d/acli.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends acli
#
## php config
RUN rm "/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
COPY .conf/php/8.3/mods-available/xdebug.ini "/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
RUN mv "/usr/local/etc/php/php.ini-development" "/usr/local/etc/php/php.ini"
# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_24.x | bash -
RUN apt-get install -y nodejs


RUN apt-get install -y git ripgrep curl unzip  jq  gnupg
# Set PATH
RUN PATH="/var/www/html/node_modules/.bin:$PATH"
RUN export PATH
RUN apt-get update \
    && apt-get install -y \
        nano \
        bash \
        libcurl4-openssl-dev \
        libzip-dev \
        libxml2-dev \
        net-tools \
        openssh-server \
    && mkdir -p /run/sshd \
    && rm -rf /var/lib/apt/lists/*

RUN printf '%s\n' \
    'Port 22' \
    'PermitRootLogin no' \
    'PasswordAuthentication no' \
    'KbdInteractiveAuthentication no' \
    'PubkeyAuthentication yes' \
    'AllowUsers webuser' \
    > /etc/ssh/sshd_config.d/web-container.conf

COPY ssh/* /root/.ssh/
COPY ssh/* /home/webuser/.ssh/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chown -R webuser:webuser /home/webuser/.ssh


ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
