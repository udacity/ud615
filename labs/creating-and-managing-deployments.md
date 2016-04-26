# Creating and Managing Deployments

Deployments make it easy to manage pods by providing an abstraction for replica sets.

## Tutorial: Create Deployments for Hello Microservice

```
kubectl create configmap nginx-frontend-conf --from-file=nginx/frontend.conf
```

```
kubectl create -f deployments/auth.yaml
```

```
kubectl create -f deployments/hello.yaml
```

```
kubectl create -f deployments/frontend.yaml
```