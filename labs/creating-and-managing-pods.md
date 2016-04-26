# Creating and managing pods

At the core of Kubernetes is the Pod. Pods hold a collection of one or more containers and volumes and represent a logical application. In this lab you will learn how to:

* Write a Pod configuration file
* Create and delete Pods
* Interact with Pods remotely using kubectl

## Tutorial: Creating Pods

Explore the `monolith` pod configuration file:

```
cat pods/monolith.yaml
```

```
kubectl create -f pods/monolith.yaml
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
