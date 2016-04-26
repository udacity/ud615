# Managing application configurations and secrets

Many applications require configuration settings and secrets such as TLS certificates to run in a production environment. In this lab you will learn how to:

* create secrets to store sensitive application data
* create configmaps to store application configuration data
* use secrets and configmaps in a pod

In this lab we will secure the monolith pod using [Nginx](http://nginx.org/en), which will serve as a reverse proxy serving HTTPS in front of the monolith container.

> The nginx container will be deployed in the same pod as the monolith container.

## Tutorial: Creating Secrets

Before we can use the nginx container to serve HTTPS traffic we need some TLS certificates. In this section we will store a set of self-signed TLS certificates in Kubernetes as secrets.

Create the `tls-certs` secret from the TLS certificates stored under the tls directory:

```
kubectl create secret generic tls-certs --from-file=tls/
```

Examine the `tls-certs` secret.

```
kubectl describe secrets certs
```

* How many items are stored under the `tls-certs` secret?
* What are key names? Where did they come from?

## Tutorial: Creating Configmaps

The nginx container also needs a configuration file to setup the reverse proxy and which TLS certs to use for HTTPS traffic. In this section we will create configmap from the proxy.conf nginx configuration file.

Create the `nginx-proxy-conf` configmap based on the proxy.conf nginx configuration file:

```
kubectl create configmap nginx-proxy-conf --from-file=nginx/proxy.conf
```

### Examine the `nginx-proxy-conf` configmap.

```
kubectl describe configmaps nginx-proxy-conf
```

## Exercise: Use Configmaps and Secrets

### Examine the `secure-monolith` pod configuration file.

```
cat pods/secure-monolith.yaml
```

* How are secrets exposed to the pod?
* How are configmaps exposed to the pod?

### Create the `secure-monolith` pod

```
kubectl create -f pods/secure-monolith.yaml
```

### Test the HTTPS support

Forward local port 10443 to 443 of the `secure-monolith` pod:

```
kubectl port-forward secure-monolith 10443:443
```

Use the `curl` command to test the HTTPS endpoint:

```
curl --cacert tls/ca.pem https://127.0.0.1:10443
```

Use the `kubectl logs` command to verify traffic to the `secure-monolith` pod:

```
kubectl logs -c nginx secure-monolith
```

## Summary

Secrets and Configmaps allow you to store application secrets and configuration data, then expose them to pods at runtime. In this lab you learned how to expose Secrets and Configmaps to pods using volume mounts. You also learned how to run multiple containers in a single pod.
