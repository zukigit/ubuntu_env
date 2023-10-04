FROM  debian:11

RUN apt update
RUN apt install build-essential binutils lintian debhelper dh-make devscripts -y
RUN apt-get install default-libmysqlclient-dev libpq-dev postgresql-client libssh2-1-dev default-mysql-client -y

