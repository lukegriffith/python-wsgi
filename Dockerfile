FROM ubuntu



ADD ./wsgi_test_script.py /var/www/html/wsgi_test_script.py

RUN apt-get update && \
  apt-get install -y apache2 apache2-utils ssl-cert && \
  apt-get install -y libapache2-mod-wsgi && \
  apt-get install -y libapache2-mod-wsgi-py3


ADD ./mod-wsgi.conf /etc/apache2/conf-available/mod-wsgi.conf
ADD ./http-foreground /usr/local/bin


STOPSIGNAL SIGINT


RUN a2enconf mod-wsgi


CMD ["http-foreground"]
