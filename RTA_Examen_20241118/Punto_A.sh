#!/bin/bash

# Identificar discos
DISCO1=$(sudo fdisk -l | grep "2 G" | awk '{print $2}' | awk -F ':' '{print $1}' | head -n 1)
DISCO2=$(sudo fdisk -l | grep "1 G" | awk '{print $2}' | awk -F ':' '{print $1}' | head -n 1)

# Particionar DISCO1 (2GB)
{
echo n      # Nueva partición
echo p      # Partición primaria
echo        # Número de partición
echo        # Primer sector por defecto
echo +1.6G  # Último sector para partición de LVM

# Cambiar tipo de partición a LVM
echo t
echo 8E

echo w # Guardar y salir
} | sudo fdisk "${DISCO1}"

# Particionar DISCO2 (1GB)
{
echo n      # Nueva partición
echo p      # Partición primaria
echo        # Número de partición
echo        # Primer sector por defecto
echo +512M  # Último sector para swap

# Cambiar tipo de partición a swap
echo t
echo 82

echo w # Guardar y salir
} | sudo fdisk "${DISCO2}"

#              SWAP
# Crear volúmenes físicos (PV)
sudo wipefs -a /dev/"${DISCO2}1"
sudo pvcreate /dev/"${DISCO2}1"

# Crear grupo de volúmenes (VG)
sudo vgcreate vg_temp /dev/"${DISCO2}1"

# Crear volúmenes lógicos (LV)
sudo lvcreate -L 512M vg_temp -n lv_swap

# Configurar el volumen lógico como swap
sudo mkswap /dev/vg_temp/lv_swap
sudo swapon /dev/vg_temp/lv_swap

#              LVM
# Crear volúmenes físicos (PV)
sudo wipefs -a /dev/"${DISCO1}1"
sudo pvcreate /dev/"${DISCO1}1"

# Crear grupo de volúmenes (VG)
sudo vgcreate vg_datos /dev/"${DISCO1}1"

# Crear volúmenes lógicos (LV)
sudo lvcreate -L 5M vg_datos -n lv_docker
sudo lvcreate -L 1.5G vg_datos -n lv_workareas

# Buscar las rutas de los volúmenes lógicos
VG_DOCKER_PATH=$(sudo lvdisplay | grep "lv_docker" -A 5 | grep "LV Path" | awk '{print $3}')
VG_WORKAREAS_PATH=$(sudo lvdisplay | grep "lv_workareas" -A 5 | grep "LV Path" | awk '{print $3}')

# Formatear los volúmenes lógicos
sudo mkfs.ext4 "$VG_DOCKER_PATH"
sudo mkfs.ext4 "$VG_WORKAREAS_PATH"

# Montar
sudo mkdir -p /var/lib/docker
sudo mkdir -p /work
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work

# Reiniciar el servicio de Docker
sudo systemctl restart docker
# Verificar el estado del servicio Docker
sudo systemctl status docker
