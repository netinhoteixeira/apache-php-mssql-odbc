# ppoffice/apache-php-mssql-odbc
Dockerfile of Apache & PHP Environment with Phalcon and Microsoft SQL Server ODBC Driver Support Built on Ubuntu Trusty

```bash
docker pull netinhoteixeira/apache-php-phalcon-mssql-odbc
```

## Build
```bash
docker build -t netinhoteixeira/apache-php-phalcon-mssql-odbc .
```

## Running
```bash
docker run -d -p 80:80 netinhoteixeira/apache-php-phalcon-mssql-odbc
```
With custom `www` folder:
```bash
docker run -d -p 80:80 -v (your site's folder):/var/www/ netinhoteixeira/apache-php-phalcon-mssql-odbc
```

# Other
Uncomment these two lines in Dockerfile to fix "non-UTF8" chars encoding and time format problems:
```bash
ADD freetds.conf /etc/freetds/
ADD locales.conf /etc/freetds/
```

## Issues
[https://github.com/netinhoteixeira/apache-php-phalcon-mssql-odbc/issues](https://github.com/netinhoteixeira/apache-php-phalcon-mssql-odbc/issues)
