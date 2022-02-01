FROM nginx
RUN useradd -ms /bin/bash www
COPY ./nginx-conf/mime.types /etc/nginx/conf/mime.types
COPY ./nginx-conf/proxy.conf /etc/nginx/proxy.conf
COPY ./nginx-conf/nginx.conf /etc/nginx/nginx.conf
COPY ./src/index.html /usr/share/nginx/html
EXPOSE 80
