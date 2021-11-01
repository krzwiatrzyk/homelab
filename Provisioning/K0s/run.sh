#!/bin/bash

sudo k0s install controller --single --config config.yaml
read -s -n 1 -p "Continue?"
echo

sudo k0s start
sudo k0s status
read -s -n 1 -p "Continue?"
echo

sudo k0s kubectl config view --raw > $HOME/.kube/config
