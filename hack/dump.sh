#!/bin/sh

# Install dependecies
sudo apt install bash git tar xz-utils gzip bzip2 curl
sudo curl -sLo /usr/local/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && sudo chmod +x /usr/local/bin/jq
sudo curl -sLo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.5.0/yq_linux_amd64 && sudo chmod +x /usr/local/bin/yq

# Kube dump
curl https://raw.githubusercontent.com/WoozyMasta/kube-dump/master/kube-dump | bash -s -- dump -a