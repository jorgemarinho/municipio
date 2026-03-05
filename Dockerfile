FROM nginx:stable-alpine

# Remove default configuration (optional) and copy our config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy site files into nginx html directory
COPY . /usr/share/nginx/html

# Expose container port 80 (will be mapeado to host 8000 via docker-compose)
EXPOSE 80

# Use default nginx entrypoint
CMD ["nginx", "-g", "daemon off;"]
