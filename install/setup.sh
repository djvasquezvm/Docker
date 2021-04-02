#docker
sudo yum install docker -y
sudo usermod -aG docker ec2-user
sudo systemctl enable --now docker

#Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#git and vim
sudo yum install git vim -y

#prueba docker
git clone https://github.com/kassambara/wordpress-docker-compose
cd wordpress-docker-compose
# Build and start installation
docker-compose up -d --build
