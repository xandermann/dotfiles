## Install K3S

```bash
curl -sfL https://get.k3s.io | sh -
# Check for Ready node, takes ~30 seconds
sudo k3s kubectl get node
```

## Install the certs to your machine

```bash
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config && chown $USER ~/.kube/config && chmod 600 ~/.kube/config && export KUBECONFIG=~/.kube/config
```

## Add this in vimrc (YAML)

```vimrc
syntax on

set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set number ruler
set autoindent smartindent
syntax enable
filetype plugin indent on
```

## Add this to bashrc

```bash
export KUBECONFIG=~/.kube/config
alias k="kubectl"

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

export EDITOR="vim"
```

## Install HELM

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

// https://cert-manager.io/docs/installation/helm/#1-add-the-helm-repository

```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
 cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true
```

## Install Kubectx

https://github.com/ahmetb/kubectx

```bash
sudo apt install kubectx
```