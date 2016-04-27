# Creating and Managing Deployments

Deployments abstract away the low level details of managing Pods. Pods are tied to the lifetime of the node they are created on. When the node goes away so does the Pod. ReplicaSets can be used to ensure one or more replicas of a Pods are always running, even when nodes fail.

Deployments sit on top of ReplicaSets and add the ability to define how updates to Pods should be rolled out.

In this lab we will combine everything we learned about Pods and Services to breakup the monolith application into smaller Services. You will create 3 deployments, one for each service:

* frontend 
* auth
* hello

You will also define internal services for the `auth` and `hello` deployments and an external service for the `frontend` deployment.

## Tutorial: Creating Deployments

### Create and Expose the Auth Deployment

```
kubectl create -f deployments/auth.yaml
```

```
kubectl create -f services/auth.yaml
```

### Create and Expose the Hello Deployment

```
kubectl create -f deployments/hello.yaml
```

```
kubectl create -f services/hello.yaml
```

### Create and Expose the Frontend Deployment


```
kubectl create configmap nginx-frontend-conf --from-file=nginx/frontend.conf
```

```
kubectl create -f deployments/frontend.yaml
```

```
kubectl create -f services/frontend.yaml
```