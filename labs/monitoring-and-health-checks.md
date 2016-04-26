# Monitoring and health checks

```
kubectl create -f kubernetes/monolith-monitoring-pod.yaml
```

```
kubectl describe pods monolith
```

```
kubectl logs monolith
```

```
kubectl port-forward monolith 10081:81
```

```
curl http://127.0.0.1:10081/readiness/status
```

```
kubectl get pods monolith
```

```
kubectl describe pods monolith
```

```
Readiness probe failed: HTTP probe failed with statuscode: 503
```

```
curl http://127.0.0.1:10081/readiness/status
```

```
kubectl get pods monolith
```

Toggle Health Status

```
curl http://127.0.0.1:10081/healthz/status
```

```
kubectl describe pods monolith
```
```
container "monolith" is unhealthy, it will be killed and re-created.
```

```
kubectl get pods
```
```
NAME       READY     STATUS    RESTARTS   AGE
monolith   1/1       Running   1          12m
```
