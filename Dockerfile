from ubuntu



add ./wsgi_test_script.py /var/www/html/wsgi_test_script.py

run apt-get update && \
  apt-get install -y apache2 apache2-utils ssl-cert && \
  apt-get install -y libapache2-mod-wsgi && \
  apt-get install -y libapache2-mod-wsgi-py3


add ./mod-wsgi.conf /etc/apache2/conf-available/mod-wsgi.conf
STOPSIGNAL SIGWINCH


run a2enconf mod-wsgi

CMD ["apache2ctl", "-D", "FOREGROUND"]
