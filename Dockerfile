FROM php:8.2-fpm-alpine

ENV APP_DIR=/var/www/html

# Install system dependencies and PHP extensions
RUN apk --no-cache add \
    bash \
    curl \
    git \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libxpm-dev \
    zlib-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-jpeg --with-webp --with-xpm \
    && docker-php-ext-install gd pdo pdo_mysql mbstring zip exif

# Install Composer (PHP dependency manager)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR

COPY . $APP_DIR

# Install PHP dependencies using Composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose the PHP-FPM port
EXPOSE 9000

# Start PHP-FPM when the container starts
CMD ["php-fpm"]