# Monitoring and Health Checks

Kubernetes supports monitoring applications in the form of readiness and liveness probes. Health checks can be performed on each container in a Pod. Readiness probes indicate when a Pod is "ready" to serve traffic. Liveness probes indicate a container is "alive".

If a liveness probe fails multiple times the container will be restarted. Liveness probes that continue to fail will cause a Pod to enter a crashloop. If a readiness check fails the container will be marked as not ready and will be removed from any load balancers.

## Tutorial: Creating Pods with Liveness and Readiness Probes.

Explore the `healty-monolith` pod configuration file:

```
cat pods/healthy-monolith.yaml
```

Create the `healty-monolith` pod using kubectl:

```
kubectl create -f pods/healthy-monolith.yaml
```

## Exercise: View Pod details

Pods will not be marked ready until the readiness probe returns an HTTP 200 response. Use the `kubectl describe` to view details for the `healty-monolith` Pod.

### Hints

```
kubectl describe pods <pod-name>
```

### Quiz

* How is the readiness of the `healty-monolith` Pod determined?
* How is the liveness of the `healty-monolith` Pod determined?
* How often will the readiness probe be checked?
* How often will the liveness probe be checked?

The example application logs each health check. Use the `kubectl logs` command to view them:

```
kubectl logs monolith
```

How often is the readiness probe checked?

## Experiment with Readiness and Liveness probes

In this section you will get a chance to observe how Kubernetes reacts to failed readiness and liveness probes. The monolith app supports the ability to toggle the HTTP status code returned for the `/healthz` and `/readiness` endpoints. Use kubectl to forward a local port to the health port of the monolith app.

The following command forwards local port 10081 to port 81 of the monolith pod:

```
kubectl port-forward monolith 10081:81
```

### Experiment with Liveness probes

At this point you can force the readiness probe to start returning HTTP status code 503 (Service Unavailable) for all new requests causing the readiness probe to fail. Use the `curl` command to toggle the readiness probe status:

```
curl http://127.0.0.1:10081/readiness/status
```

Wait about 15 seconds and view the status of the monolith pod. Are all the containers in the monolith pod ready?

```
kubectl get pods monolith
```

Use the `kubectl describe` command to get more details about the readiness check:

```
kubectl describe pods monolith
```

Examaine the events for the monolith pod. Can you find the events that indicate the readiness probe has failed?

```
Readiness probe failed: HTTP probe failed with statuscode: 503
```

Use the `curl` command again to toggle the readiness probe focing it to return HTTP 200 for all future requests:

```
curl http://127.0.0.1:10081/readiness/status
```

## Exercise: Experiment with Liveness probes

Building on what you learned in the previous use the `kubectl port-forward` and `curl` commands to toggle HTTP status for the monolith liveness probe.

> Hint: toggle the liveness probe status using the `/healthz/status` endpoint on the monolith container.

In 15 second interval use the `kubectl get pods` and `kubectl describe` commands to examine the state of the monolith pod.

Did the liveness probe fail? If so, what happened when it failed?

## Summary

In this lab you learned that Kubernetes supports application monitoring using
liveness and readiness probes. You have learned how to add readiness and liveness probes to your pods and how to review the status of a pod using kubectl. 
