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
#mkdir -p /home/moodle_data /home/moodle_db /home/moodle_dir
#chmod 777 /home/moodle_data /home/moodle_db /home/moodle_dir

#Descomprimir moodle del internet hacia la carpeta del codigo
#tar -xzvf moodle-3.8.4.tgz -C /home/moodle_source

#Crear containers de docker
docker-compose up -d
