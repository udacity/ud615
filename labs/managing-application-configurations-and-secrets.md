# Managing application configurations and secrets

## Tutorial: Creating Secrets

```
kubectl create secret generic tls-certs --from-file=tls/
```

```
kubectl describe secrets certs
```

## Tutorial: Creating Configmaps

```
kubectl create configmap nginx-proxy-conf --from-file=nginx/proxy.conf
```

```
kubectl describe configmaps nginx-proxy-conf
```

## Tutorial: Using Configmaps and Secrets

```
kubectl create -f monolith-secure-pod.yaml
```

```
kubectl get pods
```

```
kubectl port-forward monolith-secure 10443:443
```

```
curl --cacert kubernetes/tls/ca.pem https://127.0.0.1:10443
```

```
kubectl logs -c nginx monolith-secure
```

## Summary
