FROM '123majumundur/php-7.1-nginx:cicd'
MAINTAINER Hamzah Nur Rohman <hamzahnurrohman7@gmail.com>

#Install Prestissimo
RUN composer global require hirak/prestissimo

#Make dir for hosting the apps
RUN mkdir /home/app/app
WORKDIR /home/app/app

#Install Dependencies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

#Copy codebase
COPY --chown=app:root ../

#run composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

#deploy di port 8080
EXPOSE 8080
