sudo docker swarm init --advertise-addr=10.0.0.10
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
