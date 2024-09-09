FROM nginx:latest

COPY ./index.html /usr/share/nginx/html/index.html
COPY ./main.css  /usr/share/nginx/html/main.css
COPY ./privacy.html  /usr/share/nginx/html/privacy.html
COPY ./contact.html  /usr/share/nginx/html/contact.html
COPY ./images /usr/share/nginx/html/images

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf