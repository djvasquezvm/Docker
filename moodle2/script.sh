#Desactivar SELINUX
sed -i s/SELINUX=enforcing/SELINUX=permissive/g /etc/selinux/config
setenforce 0

#Habilitar Docker
systemctl enable --now docker

#Descargar Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

#Crear Carpetas para guardar la data y dar permisos
mkdir -p /home/mariadb_data /home/moodle_data /home/moodledata_data
chmod 777 /home/mariadb_data /home/moodle_data /home/moodledata_data

#Descomprimir moodle del internet hacia la carpeta del codigo
#tar -xzvf moodle-latest-39.tgz -C /home/moodle_data

#Crear containers de docker
docker-compose up -d
