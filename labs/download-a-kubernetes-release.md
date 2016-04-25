# Download a Kubernetes Release

Offical Kubernetes releases are hosted on GitHub.

```
wget https://github.com/kubernetes/kubernetes/releases/download/v1.2.3/kubernetes.tar.gz
tar -xvf kubernetes.tar.gz
tar -xvf kubernetes/server/kubernetes-server-linux-amd64.tar.gz
sudo cp kubernetes/server/bin/hyperkube /usr/local/bin/
sudo cp kubernetes/server/bin/kubectl /usr/local/bin/
```
