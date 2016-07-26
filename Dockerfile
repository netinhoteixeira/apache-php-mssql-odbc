FROM ppoffice/mssql-odbc
MAINTAINER Francisco Ernesto Teixeira <fco.ernesto@gmail.com>

#RUN apt-get update && \
#    apt-get -y install apache2 php5 php5-mssql && \
#    apt-get -y autoremove && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get -y install apache2 libapache2-mod-php5.6 php5.6 php5.6-cli php5.6-common php5.6-json php5.6-readline php5.6-sybase php5.6-dev php5.6-mysql gcc libpcre3-dev git
RUN apt-get -y autoremove
RUN cd /opt && \
    git clone --depth=1 git://github.com/phalcon/cphalcon.git && \
    cd cphalcon/build && \
    ./install
RUN printf "; configuration for php common module\n; priority=20\nextension=phalcon.so" > /etc/php/5.6/mods-available/phalcon.ini
RUN php5enmod phalcon

RUN /usr/sbin/a2enmod rewrite
RUN php5enmod mssql

# Edit 000-default.conf to change apache site settings.
ADD 000-default.conf /etc/apache2/sites-available/

# Uncomment these two lines to fix "non-UTF8" chars encoding and time format problems
# ADD freetds.conf /etc/freetds/
# ADD locales.conf /etc/freetds/

EXPOSE 80
#EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
