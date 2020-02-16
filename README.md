# Local Development

```bash
kubectl apply -f k8s/database-persistent-volume-claim.yaml
kubectl apply -f k8s/postgres-deployment.yaml
kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/postgres-cluster-ip-service.yaml
kubectl apply -f k8s/redis-cluster-ip-service.yaml

skaffold dev
```
