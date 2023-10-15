FROM nginx:alpine

ARG HTTP_PORT HTTPS_PORT

ENV HTTP_PORT=${HTTP_PORT:-80} \
  HTTPS_PORT=${HTTPS_PORT:-443}

COPY --chown=nginx:nginx ./infrastructure/config/nginx.conf /etc/nginx/nginx.conf

USER nginx

EXPOSE $HTTP_PORT $HTTPS_PORT

CMD ["nginx"]
