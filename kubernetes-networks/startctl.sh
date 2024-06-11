#!/bin/bash
kubectl label nodes minikube homework=true
kubectl apply -f ./namespace.yaml
kubectl apply -f ./service.yaml
kubectl apply -f ./configmap.yaml
kubectl apply -f ./deployment.yaml
kubectl apply -f ./ingress.yaml
