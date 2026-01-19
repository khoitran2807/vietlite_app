# Build Flutter web
FROM cirrusci/flutter:stable AS build
WORKDIR /app
COPY . .
RUN flutter build web

# Serve bằng nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
