# Monitoring and health checks

Kubernetes supports monitoring applications in the form of readiness and liveness probes. Health checks on be performed on each container in a pod. Readiness probes indicate when a pod is "ready" to serve traffice. Liveness probes indicate a container is "alive". If a liveness probe fails multiple times the container will be restarted. Liveness probes that continue to fail will cause a pod to enter a crashloop.

## Creating Pods with Liveness and Readiness Probes.

### Review the monolith-monitoring pod

Liveness probes are defined for each container in a pod using the `spec.containers.livenessProbe` key:

```
livenessProbe:
  httpGet:
    path: /healthz
    port: 81
    scheme: HTTP
  initialDelaySeconds: 5
  periodSeconds: 15
  timeoutSeconds: 5
```

Readiness probes are defined for each container in a pod using the `spec.containers.readinessProbe` key:

```
readinessProbe:
  httpGet:
    path: /readiness
    port: 81
    scheme: HTTP
  initialDelaySeconds: 5
  timeoutSeconds: 1
```

Create the pod with the kubectl create command:

```
kubectl create -f kubernetes/monolith-monitoring-pod.yaml
```

Pods will not be marked ready until the readiness probe return an HTTP 200 response. Use the kubectl describe command to get pod status details:

```
kubectl describe pods monolith
```

The example application logs each health check. Use the `kubectl logs` command to view them:

```
kubectl logs monolith
```

How often is the readiness probe checked?

## Experiment with Readiness and Liveness probes

In this section you will get a chance to observe how Kubernetes reacts to failed readiness and liveness probes. The monolith app supports the ability to toggle the HTTP status code returned for the `/healthz` and `/readiness` endpoints. Use kubectl to forward a local port to the health port of the monolith app.

The following command fowards local port 10081 to port 81 of the monolith pod:

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

### Experiment with Liveness probes

Building on what you learned in the previous use the `kubectl port-forward` and `curl` commands to toggle HTTP status for the monolith liveness probe.

> Hint: toggle the liveness probe status using the `/healthz/status` endpoint on the monolith container.

In 15 second interval use the `kubectl get pods` and `kubectl describe` commands to examine the state of the monolith pod.

Did the liveness probe fail? If so, what happened when it failed?

## Summary

In this lab you learned that Kubernetes supports application monitoring using
liveness and readiness probes. You have learned how to add readiness and liveness probes to your pods and how to review the status of a pod using kubectl. 
