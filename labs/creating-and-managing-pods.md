# Creating and managing pods

### Creating Pods

```
kubectl create -f kubernetes/monolith-pod.yaml
```

### Listing Pods

```
kubectl get pods
```

### Pod info

```
kubectl describe pods monolith
```

### Port Forwarding

```
kubectl port-forward monolith 10080:80
```

```
curl http://127.0.0.1:10080
```

### Logs

```
kubectl logs monolith
```

### Exec

```
kubectl exec monolith --stdin --tty -c monolith /bin/sh
```

### Delete

```
kubectl delete pods monolith
```
