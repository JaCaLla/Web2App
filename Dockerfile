# Nginx base image
FROM nginx:alpine

# Copy HTML file into container
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (defect port for Nginx)
EXPOSE 80
