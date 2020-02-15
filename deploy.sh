docker build -t cecnic1989/multi-client:latest -t cecnic1989/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t cecnic1989/multi-server:latest -t cecnic1989/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t cecnic1989/multi-worker:latest -t cecnic1989/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push cecnic1989/multi-client:latest
docker push cecnic1989/multi-server:latest
docker push cecnic1989/multi-worker:latest

docker push cecnic1989/multi-client:$SHA
docker push cecnic1989/multi-server:$SHA
docker push cecnic1989/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=cecnic1989/multi-client:$SHA
kubectl set image deployments/server-deployment server=cecnic1989/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=cecnic1989/multi-worker:$SHA
