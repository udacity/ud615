# Creating and Managing Services

Services provide stable endpoints for Pods based on a set of labels.

In this lab you will create the `monolith` service. You learn how to:

* Create a service
* Use label selectors to expose a limited set of Pods externally

## Tutorial: Create a Service

Explore the monolith service configuration file:

```
cat services/monolith.yaml 
```

Create the monolith service using kubectl:

```
kubectl create -f services/monolith.yaml
```

Use the `gcloud compute firewall-rules` command to allow traffic to the `monolith` service:

```
gcloud compute firewall-rules create allow-monolith-nodeport \
  --allow=tcp:31000
```

## Exercise: Interact with the Monolith Service Remotely

### Hints

```
gcloud compute instances list
```

```
curl -k https://<EXTERNAL_IP>:31000
```

### Quiz

* Why are you unable to get a response from the `monolith` service?

## Exercise: Explore the monolith Service

### Hints

```
kubectl get services monolith
```

```
kubectl describe services monolith
```

### Quiz

* How many endpoints does the `monolith` service have?
* What labels must a Pod have to be picked up by the `monolith` service?  

## Exercise: Add the Missing Label

Currently the `monolith` service does not have any endpoints. Use the `kubectl label` command to fix the problem.

### Hints

```
kubectl label pods <pod-name> '<key>=<value>'
```

```
kubectl describe services monolith
```

## Exercise: Interact with the Monolith Service Remotely

### Hints

```
gcloud compute instances list
```

```
curl -k https://<EXTERNAL_IP>:31000
```

## Exercise: Remove the Required Label

In this exercise you will observe what happens when a required label is removed from a Pod.

Use the `kubectl label` command to remove the `secure` label from the `secure-monolith` Pod.

### Hints

```
kubectl label pods secure-monolith secure-
```

```
kubectl describe services monolith
```

### Quiz

* How many endpoints does the `monolith` service have?

## Summary
