sudo k0s install controller --single --config config.yaml
sudo k0s start

sudo k0s kubectl config view --raw > $HOME/.kube/config