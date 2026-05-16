#FROM nginx:alpine

#COPY index.html /usr/share/nginx/html/
#COPY css /usr/share/nginx/html/css
#COPY js /usr/share/nginx/html/js
#COPY nginx.conf /etc/nginx/conf.d/default.conf

#EXPOSE 80


FROM nginx:stable-alpine-slim

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy application files
COPY index.html /usr/share/nginx/html/
COPY css /usr/share/nginx/html/css
COPY js /usr/share/nginx/html/js

# Custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
