Не уверен, что это- то что нужно, но все же опишу хистори команд, при выполнении домашнего задания.  
+ Создал ветку и переклюичся в нее.  
`git checkout -b kubernetes-controllers`  
+ Создал директорию.   
`mkdir kubernetes-controllers`  
`cd kubernetes-controllers`  
+ Взял описание namespace из прошлого домашнего задания и перенаправил в фаил namespace.yaml  
`cat > namespace.yaml`  
+ Сделал commit  
`Git add .`  
`git commit -m "add namespace"`   
`git status`  
`cd kubernetes-controllers`  
+ Повторил процедуру с остальными элементами из прошлого ДЗ.  
`touch deployment.yaml`  
`cat > service.yaml`  
`cat > configmap.yaml`  
`cat > deployment.yaml`  
+ Пришлось отказаться от **lifecycle: preStop:** так как deployment не запускался, выдавая ошибку. В итоге списывал deployments с какого то примера в интернете, под свой pod попутно читая документацию с примерами, понял что стратегия описывается на том же уровне что и темплейт. 
+ Применил namesspace.yaml  
`k apply -f namespace.yaml`  
`k get ns`  
+ Применил весь проект.  
`k apply -f .`  
+ Попробовал посмотреть pod  
`k get po`  
+ Посмотерл pod в правильном namespace  
`k get pod -n homework`  
+ Убедился что pod работает и скачал index.html    
`k exec -n homework -ti web-apps-dp-5fb48d784d-j4twv -- curl http://localhost:8000`  
+ Убедившись что pod выполнил задачу, сделал commit, так как было похоже на работающую задачу.  
`git commit - m "looks like work"`  
`k get po -A`  
+ Посмотрел на результат "с разных углов"    
`k get deployments.apps -n homework`  
`k get rs`  
`k get rs -n homework`  
`k describe deployments.apps -n homework web-apps-dp`   
`k describe deployments.apps -n homework web-apps-dp`  
`k edit deployments.apps -n homework web-apps-dp`  
`k get po -n homework`  
`k get po -n homework`  
`k edit deployments.apps -n homework web-apps-dp`  
`k get po -n homework`  
+ Попробовал увеличить количество реплик.     
`k scale deployment -n homework web-apps-dp --replicas=14`  
`k get po -n homework`   
+ Поскольку всё очень медленно поднималось, не стал дожидаться вернул к изначальным 3м репликам.   
`k scale deployment -n homework web-apps-dp --replicas=3`  
+ посмотреть с ключём -w очень не наглядно оказалось.   
`k get po -n homework -w`  
### Удалил весь проект  
`k delete -f .`  
### Запустил заново  
`k apply -f .`  
`k apply -f namespace.yaml`   
`k apply -f .`   
`k get -n homework deployments.apps`   
`k get replicasets.apps -n homework`   
`k get pod -n homework`   
`k describe -n homework deployments.apps`   
### Посмотрел как работает. Закоммитил.      
`git commit -m "add Strategy RollingUpdate \ maxUnavaillable:1"`  
`k get deployments.apps -n homework`  
### Удалил проект  
+ Описал readlines probe по примеру из документации.  
```
        readinessProbe:
          exec:
            command:
            - cat
            - /homework/index.html
          initialDelaySeconds: 5
          periodSeconds: 3
```
+ Запустил заново  
`k apply -f .` 
`k get replicasets.apps -n homework`  
`k get deployments.apps -n homework`  
`k describe deployments.apps -n homework web-apps-dp`  
`k describe -n homework pods web-apps-dp-577d55cf98-pkmdw`  
`k describe -n homework pods web-apps-dp-577d55cf98-pkmdw`  
`k describe -n homework pods web-apps-dp-577d55cf98-d5fjx` 
`k describe -n homework pods web-apps-dp-577d55cf98-6tdct`  
`k edit deployments.apps -n homework web-apps-dp`  
+ Выглядит как работает. Закоммитил.  
`git commit -m "add readinesProbe"`  
`k get nodes`  
`k describe nodes minikube`  
`k get nodes --show-labels`  
`k label node minikube`  
+ Посмотрел как назнчаются label нодам  
`kubectl get nodes --show-labels`  
`kubectl get nodes --show-labels`  
### Назначил minikube lable homework=true 
`k label nodes minikube homework=true`  
`k describe nodes minikube`

добавил в deployment 
``` 
     spec:
      nodeSelector:
        homework: "true"  
```
+ по началу не заработало так как "" не указал ковычки и не в том месте указал nodeSelector          

`k apply -f deployment.yaml`  
`kubectl get nodes --show-labels` 
`k apply -f deployment.yaml`  
`k delete deployments.apps -n homework web-apps-dp`  
`k apply -f deployment.yaml`  
`k apply -f deployment.yaml` 
`k get pod -n homework`  
`k get rs -A`  
`k get dp -A`  
`k get deployments.apps -A`  
`k describe deployments.apps -n homework web-apps-dp`  
`kubectl get nodes --show-labels`  
+ когда проект стал запускатся сделал коммит.  
`git commit -n "add nodeSelector"`  


### Сделал два sh файла для запуска проекта и остановки, зачистки проекта на minikube  добавил в branch.  
+ Пробовал сделать запуск проекта отдельным init контейнером, но запустался в монтировании манифестов hostPath и возмжно в уровнях абстракций, решил это попробовать потом.   


