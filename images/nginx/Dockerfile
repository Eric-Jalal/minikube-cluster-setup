FROM nginx:1.25.4-alpine

ARG GIT_COMMIT=unspecified
LABEL org.mybigcompany=$GIT_COMMIT

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start-nginx.sh /usr/local/bin/start-nginx.sh

RUN chmod 755 /usr/local/bin/start-nginx.sh && \
    rm /etc/nginx/conf.d/default.conf && \
    sed -i 's/^user  nginx;/user  nginx;/' /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 755 /var/cache/nginx /var/run /var/log/nginx && \

# Switching to a non-privileged user is recommended but requires extra steps in Kubernetes
# USER nginx

ENTRYPOINT ["/usr/local/bin/start-nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]

