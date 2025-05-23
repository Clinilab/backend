# Imagen base PHP 7.4
FROM php:7.4-apache

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    git unzip zip libpq-dev libzip-dev libonig-dev libxml2-dev libicu-dev \
    zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev \
    && docker-php-ext-install pdo pdo_pgsql intl iconv zip gd ctype

# Activar mod_rewrite de Apache
RUN a2enmod rewrite

# Cambiar DocumentRoot a /public
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

# Copiar composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Directorio de trabajo
WORKDIR /var/www/html/

# Copiar archivos del proyecto
COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1

# Instalar dependencias Symfony
RUN composer install --no-interaction --no-scripts

# Limpiar caché
RUN php bin/console cache:clear

# Permisos
RUN chown -R www-data:www-data var

EXPOSE 80
