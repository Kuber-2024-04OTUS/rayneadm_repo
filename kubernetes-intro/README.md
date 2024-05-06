Every time when i run **kubectl apply -f .** i've get mistake like:  

`Error from server (NotFound): error when creating "configmap.yaml": namespaces "homework" not found`  

Becouse I don't now how to run all of this files by kubectl without mistake about namespase, i just make some order with numbers:  
  
```
0.namespace.yaml
1.service.yaml
2.configmap.yaml
3.pod.yaml
```

To show result use:

```shell 
kubectl exec -it web-pod -n homework -- curl localhost:8000
```
