# Install and configure the Kubelet

## node1

```
gcloud compute ssh node1
```

### Download Kubernetes release tar

See the [Download a Kubernetes release](labs/download-a-kubernetes-release.md) lab.

### Create the kubelet systemd unit file:

```
[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/GoogleCloudPlatform/kubernetes
After=docker.service
Requires=docker.service

[Service]
ExecStart=/usr/local/bin/hyperkube \
  kubelet \
  --api-servers=http://127.0.0.1:8080 \
  --allow-privileged=true
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

Review the kubelet unit file:

```
cat kubelet.service
```

Start the kubelet service:

```
sudo mv kubelet.service /etc/systemd/system/
```

```
sudo systemctl daemon-reload
sudo systemctl enable kubelet
sudo systemctl start kubelet
```

### Verify

```
sudo systemctl status kubelet
```

#### laptop

```
kubectl get nodes
```
