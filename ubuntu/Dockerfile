FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y gcc make curl nginx

ENV VERSION=0.15.01
RUN curl -sfLO https://github.com/ColinIanKing/stress-ng/archive/V${VERSION}.tar.gz
RUN tar xvf V${VERSION}.tar.gz && cd stress-ng-${VERSION} && make && make install

COPY run_nginx.sh /usr/local/bin/
COPY nginx.conf /etc/nginx
COPY nginx_default_server.conf /etc/nginx/sites-available/default

RUN rm /var/www/html/*.html
RUN cp `which stress-ng` /var/www/html

CMD ["/usr/local/bin/run_nginx.sh"]


