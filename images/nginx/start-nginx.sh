#!/bin/sh
# Replace placeholders in nginx.conf.template with environment variables and output to nginx.conf
envsubst '${POD_IP}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start Nginx in the foreground
nginx -g 'daemon off;'

