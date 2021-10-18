CREATE=true
INGRESS_NGINX=true
INGRESS_AMBASSADOR=false
CERT_ISSUER=true
ARGOCD=true

if [ "$CREATE" = true ]; then
  kind create cluster --config=cluster.yaml
fi

if [ "$INGRESS_NGINX" = true ]; then
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
fi

if [ "$INGRESS_AMBASSADOR" = true ]; then
  kubectl apply -f https://github.com/datawire/ambassador-operator/releases/latest/download/ambassador-operator-crds.yaml
  kubectl apply -n ambassador -f https://github.com/datawire/ambassador-operator/releases/latest/download/ambassador-operator-kind.yaml
fi

if [ "$CERT_ISSUER" = true ]; then
  kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.2/cert-manager.yaml
  kubectl apply -f cert-issuer.yaml 
fi

if [ "$ARGOCD" = true ]; then
  kubectl create namespace argocd
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  kubectl apply -n argocd argocd-ingress.yaml
fi
