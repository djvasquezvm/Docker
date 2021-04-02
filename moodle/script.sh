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
mkdir -p /home/moodledata /home/moodle_db /home/moodle_source
chmod 777 /home/moodledata /home/moodle_db /home/moodle_source

#Descomprimir moodle del internet hacia la carpeta del codigo
tar -xzvf moodle.tgz -C /home/moodle_source

#Crear containers de docker
docker-compose up -d
