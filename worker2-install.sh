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
sudo apt update && apt install -y kubeadm=1.16.0-00 kubelet=1.16.0-00 kubectl=1.16.0-00

# Kubernetes Deployment
sudo swapoff –a
sudo hostnamectl set-hostname wroker2
sudo reboot
