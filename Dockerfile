FROM alpine:3.19

RUN apk add --no-cache nginx && \
    mkdir -p /run/nginx /var/www/html /var/lib/nginx/logs /var/lib/nginx/tmp && \
    chown -R nobody:nobody /run/nginx /var/www/html /var/lib/nginx && \
    chmod -R 755 /run/nginx /var/www/html /var/lib/nginx && \
    touch /var/lib/nginx/logs/error.log /var/lib/nginx/logs/access.log && \
    chown nobody:nobody /var/lib/nginx/logs/error.log /var/lib/nginx/logs/access.log && \
    chmod 644 /var/lib/nginx/logs/error.log /var/lib/nginx/logs/access.log

COPY conf/nginx.conf /etc/nginx/nginx.conf

VOLUME /var/www/html

EXPOSE 8080

USER nobody

CMD ["nginx", "-g", "daemon off;"]