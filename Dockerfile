FROM nginx:alpine

# Copy Flutter web build vào nginx
COPY build/web /usr/share/nginx/html

# Mở cổng 80
EXPOSE 80

# Chạy nginx
CMD ["nginx", "-g", "daemon off;"]
