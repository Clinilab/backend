# Imagen base con PHP 7.4 y Apache
FROM php:7.4-apache

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    git unzip zip libpq-dev libzip-dev libonig-dev libxml2-dev libicu-dev \
    zlib1g-dev libjpeg-dev libpng-dev libfreetype6-dev \
    && docker-php-ext-install pdo pdo_pgsql intl iconv zip gd ctype

# Habilitar módulos de Apache
RUN a2enmod rewrite headers

# Cambiar DocumentRoot a /public
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

# Copiar composer desde imagen oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Establecer el directorio de trabajo
WORKDIR /var/www/html/

# Copiar todos los archivos del proyecto
COPY . .

# Instalar dependencias PHP (incluye nelmio/cors si está en composer.json)
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-interaction --optimize-autoloader --no-dev

# Limpiar caché en modo producción
RUN php bin/console cache:clear --env=prod

# Ajustar permisos
RUN chown -R www-data:www-data var

EXPOSE 80
