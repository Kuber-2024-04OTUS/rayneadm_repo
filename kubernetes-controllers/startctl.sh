#!/bin/bash
kubectl label nodes minikube homework=true
kubectl apply -f ./namespace.yaml
kubectl apply -f ./service.yaml
kubectl apply -f ./configmap.yaml
kubectl apply -f ./deployment.yaml
sleep 10
for pod in $(kubectl get pods --namespace=homework -o name); do 
    sleep 1 && kubectl exec -n homework -ti ${pod} -- curl http://localhost:8000
done