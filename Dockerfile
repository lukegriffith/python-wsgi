FROM ubuntu


RUN apt-get update && \
  apt-get install -y apache2 apache2-utils ssl-cert && \
  apt-get install -y libapache2-mod-wsgi && \
  apt-get install -y libapache2-mod-wsgi-py3

ADD ./mod-wsgi.conf /etc/apache2/conf-available/mod-wsgi.conf
ADD ./static /var/www/html
ADD ./sites-available.conf /etc/apache2/sites-available/djangosite.conf
ADD ./apache2.conf /etc/apache2/apache2.conf
ADD ./http-foreground /usr/local/bin


STOPSIGNAL SIGINT


RUN a2enconf djangosite


CMD ["http-foreground"]
