# Provisioning Ubuntu 16.04 on Google Compute Engine

In this lab you will provision two GCE instances running Ubuntu 16.04. These instances will be used to provision a two node Kubernetes cluster.

## Provision 2 GCE instances

### Provision Ubuntu using the gcloud CLI

#### node0

```
gcloud compute instances create node0 \
 --image-project ubuntu-os-cloud \
 --image ubuntu-1604-xenial-v20160420c \
 --boot-disk-size 200GB \
 --machine-type n1-standard-1 \
 --can-ip-forward
```

#### node1

```
gcloud compute instances create node1 \
 --image-project ubuntu-os-cloud \
 --image ubuntu-1604-xenial-v20160420c \
 --boot-disk-size 200GB \
 --machine-type n1-standard-1 \
 --can-ip-forward
```

#### Verify

```
gcloud compute instances list
```
