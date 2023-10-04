FROM  ubuntu:22.04

RUN apt update -y
RUN apt install build-essential binutils lintian debhelper dh-make devscripts -y
RUN apt-get install default-libmysqlclient-dev libpq-dev postgresql-client libssh2-1-dev default-mysql-client -y
RUN apt-get autoremove -y

COPY sleep10.sh /tmp
COPY json-c-0.9.tar.gz /tmp
COPY libtar-1.2.20-src-11.31.tar.gz /tmp

RUN tar -xvzf /tmp/json-c-0.9.tar.gz -C /tmp/ && \
    tar -xvzf /tmp/libtar-1.2.20-src-11.31.tar.gz -C /tmp/ && \
    rm -rf /tmp/*.tar.gz

RUN cd /tmp/json-c-0.9/ && \
    ./configure --with-pic &&  \
    make && make install

RUN cd /tmp/libtar-1.2.20/ && \
    ./configure --with-pic &&  \
    make && make install

CMD [ "./tmp/sleep10.sh" ]