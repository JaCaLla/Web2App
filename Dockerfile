# Usar la imagen base de Nginx
FROM nginx:alpine

# Copiar el archivo HTML al contenedor
COPY index.html /usr/share/nginx/html/index.html

# Exponer el puerto 80 (puerto por defecto de Nginx)
EXPOSE 80
