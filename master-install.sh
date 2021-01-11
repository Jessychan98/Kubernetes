#!/bin/sh

# Update & Upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Install Curl
sudo apt-get install curl -y

# Install, start & enable Docker
sudo apt-get install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker

# Install kubernetes
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install kubeadm kubelet kubectl -y

# Kubernetes Deployment
sudo swapoff –a
sudo hostnamectl set-hostname master-node

# Initialize master node
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy pod network to cluster
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
