#!/bin/bash

# Ruta del directorio
cd /home/mauro/repogit/UTN-FRA_SO_Examenes/202406/docker

# Modificar el archivo index.html
sudo cat << 'FIN' > "index.html"
<div>
  <h1>Sistemas Operativos - UTNFRA</h1><br>
  <h2>2do Parcial - Junio 2024</h2><br>
  <h3>Mauro Sosa</h3>
  <h3>División: 115</h3>
</div>
FIN

# Crear Dockerfile
sudo cat << 'FIN' > Dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/
EXPOSE 80
FIN

# Construir la imagen de Docker
docker build -t maurososa988/web1-sosa:latest .

# Subir la imagen a Docker Hub
docker push maurososa988/web1-sosa:latest

# Crear el archivo run.sh
cat << 'FIN' > run.sh
#!/bin/bash
docker run -d -p 8080:80 maurososa988/web1-sosa:latest
FIN

# Dar permisos de ejecución a run.sh
chmod 764 run.sh

# Ejecutar la imagen
./run.sh

