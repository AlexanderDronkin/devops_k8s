#!/usr/bin/bash

# Удаление и установка кластера k0s в режиме одной ноды

USER=$(whoami)

sudo k0s stop
sudo k0s reset
sudo k0s install controller --single
sudo k0s start
sleep 10
sudo k0s status
sleep 5
rm -f "/home/${USER}/.kube/config"
touch "/home/${USER}/.kube/config"
sudo k0s kubeconfig admin | tee -a "/home/${USER}/.kube/config"
chmod 0600 "/home/${USER}/.kube/config"
export KUBECONFIG="/home/${USER}/.kube/config"
sleep 2
kubectl config rename-context Default Podrygka
kubectl get nodes --watch
