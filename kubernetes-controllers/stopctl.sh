#!/bin/bash 
kubectl delete namespace homework
kubectl label nodes minikube homework-
