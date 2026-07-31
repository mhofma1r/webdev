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

# Set up user and permissions
RUN mkdir -p "/home/webuser"
RUN groupadd -r webuser --gid=1000
RUN useradd -r -g webuser --uid=1000 -d "/home/webuser" webuser
RUN chown -R webuser:webuser "/home/webuser"

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
#
## php config
RUN rm "/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
COPY .conf/php/8.3/mods-available/xdebug.ini "/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
RUN mv "/usr/local/etc/php/php.ini-development" "/usr/local/etc/php/php.ini"
# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_24.x | bash -
RUN apt-get install -y nodejs
## AI agent
RUN npm i -g @openai/codex
# Install day-to-day development tools.
COPY agent /usr/local/bin/agent
RUN chmod +x /usr/local/bin/agent
# Playwright
RUN npm install -g playwright

# Browser und Dependencies installieren
RUN playwright install chromium
RUN playwright install-deps chromium

RUN apt-get install -y git ripgrep curl unzip sqlite3 jq  gnupg
# Set PATH
RUN PATH="/var/www/html/node_modules/.bin:$PATH"
RUN export PATH

CMD ["apache2-foreground"]
USER 1000:1000
