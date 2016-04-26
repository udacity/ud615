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

Create the `monolith` pod using kubectl:

```
kubectl create -f pods/monolith.yaml
```

## Exercise: View Pod details

Use the `kubectl get` and `kubect describe` commands to view details for `monolith` Pod:

Hints

```
kubectl get pods <pod-name>
```

```
kubectl describe pods <pod-name>
```

* What is the IP address of the `monolith` pod?
* What node is the `monolith` pod running on?

## Exercise: Interact with a Pod remotely

Pods are allocated a private IP address by default and cannot be reached outside of the cluster. In this exercise use the `kubectl port-forward` command to map a local port to a port inside the `monolith` pod. 

Hints 

```
kubectl port-forward monolith 10080:80
```

```
curl http://127.0.0.1:10080
```

```
curl http://127.0.0.1:10080/secure
```

```
curl http://127.0.0.1:10080/login
```

```
curl http://127.0.0.1:10080/secure
```

## Exercise: View the logs of a Pod

Use the `kubectl logs` command to view the logs for the `monolith` Pod:

```
kubectl logs monolith
```

> Use the -f flag and observe what happens.

## Exercise: Run an interactive shell inside a Pod

Use the `kubectl exec` command to run an interactive shell inside the `monolith` Pod:

```
kubectl exec monolith --stdin --tty -c monolith /bin/sh
```
