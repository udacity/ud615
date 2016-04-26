# Creating and Managing Deployments

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