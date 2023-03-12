FROM alpine:3.17

RUN apk add --no-cache squid apache2-utils

COPY start.sh /usr/local/bin/
COPY conf/squid*.conf /etc/squid/

RUN chmod +x /usr/local/bin/start.sh

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/start.sh"]
