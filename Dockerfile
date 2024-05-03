# Use the official PHP 7.4 image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the CodeIgniter 3 project files to the container
COPY . /var/www/html

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set up Apache configuration for CodeIgniter
RUN echo "<Directory /var/www/html>" > /etc/apache2/conf-available/codeigniter.conf \
    && echo "    Options Indexes FollowSymLinks" >> /etc/apache2/conf-available/codeigniter.conf \
    && echo "    AllowOverride All" >> /etc/apache2/conf-available/codeigniter.conf \
    && echo "    Require all granted" >> /etc/apache2/conf-available/codeigniter.conf \
    && echo "</Directory>" >> /etc/apache2/conf-available/codeigniter.conf \
    && a2enconf codeigniter

# Install dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    cron \
    && docker-php-ext-install zip mysqli pdo_mysql \
    && docker-php-ext-enable zip mysqli pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Set recommended PHP.ini settings
# See https://codeigniter.com/user_guide/general/alternative_php.html
COPY php.ini /usr/local/etc/php/

# Copy crontab file to the cron.d directory
COPY crontab.txt /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Apply cron job
RUN crontab /etc/cron.d/crontab

# Expose port 80 and start Apache server
EXPOSE 80
CMD ["apache2-foreground"]
