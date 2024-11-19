#!/bin/bash

# Ruta donde se guardará el script
script_destino="/usr/local/bin/sosaAltaUser-Groups.sh"

# Crear el script en la ubicación especificada
sudo cat << 'FIN' > "$script_destino"
#!/bin/bash

P1="\$1"  # Usuario para obtener la clave
P2="\$2"  # Ruta al archivo Lista_Usuarios.txt

# Guarda la contraseña de un usuario
CLAVE=\$(sudo grep "\${P1}" /etc/shadow | awk -F ':' '{print \$2}')

# Crear grupos
# Leer el archivo desde la línea 8
sed -n '8,\$p' "\$P2" | awk -F ',' '{print \$2}' | while read grupo; do
  # Crear grupo solo si no existe
  if ! getent group "\$grupo" > /dev/null; then
    sudo groupadd "\$grupo"
    echo "Grupo \$grupo creado."
  else
    echo "Grupo \$grupo ya existe, no se crea."
  fi
done

# Crear usuarios
# Leer el archivo desde la línea 8
sed -n '8,\$p' "\$P2" | while IFS=, read -r usuario grupo directorio; do
  # Crear directorio solo si no existe
  sudo mkdir -p "\$directorio"
  
  # Crear usuario solo si no existe
  if ! id "\$usuario" &>/dev/null; then
    sudo useradd -m -s /bin/bash -G "\$grupo" -d "\$directorio" -p "\$CLAVE" "\$usuario"
    echo "Usuario \$usuario creado con éxito."
  else
    echo "El usuario \$usuario ya existe, no se crea."
  fi
done
FIN

# Darle permisos de ejecución al script creado
sudo chmod 764 "$script_destino"
