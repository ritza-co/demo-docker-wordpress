FROM wordpress:apache
WORKDIR /usr/src/wordpress
RUN set -eux; \
	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
	cp -s wp-config-docker.php wp-config.php
COPY custom-theme/ ./wp-content/themes/custom-theme/
COPY custom-plugin/ ./wp-content/plugins/custom-plugin/

# FROM wordpress

# # Set environment variables used by the Wordpress image
# # DB_USER and DB_PASSWORD are included as an example.
# ENV WORDPRESS_DB_HOST=127.0.0.1 \
#     WORDPRESS_DB_USER=wpuser \
#     WORDPRESS_DB_PASSWORD=super-secret-password \
#     WORDPRESS_DB_NAME=wpsite \
#     WORDPRESS_TABLE_PREFIX=wp_

# # COPY plugins/ /var/www/html/wp-content/plugins
# # COPY themes/ /var/www/html/wp-content/themes
# # COPY uploads/ /var/www/html/wp-content/uploads