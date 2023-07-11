1. alias k=kubectl


2. vi mysql_deployment.yml

edit the file to have the changes

3. After editing apply changes

```
k apply -f mysql_deployment.yml
```

4. Make sure the application is running before confirming 


```
thor@jump_host ~$ k get all
NAME                                    READY   STATUS              RESTARTS   AGE
pod/mysql-deployment-74f5dd5cdf-g8q4c   0/1     ContainerCreating   0          2s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP          15s
service/mysql        NodePort    10.96.95.124   <none>        3306:30011/TCP   2s

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql-deployment   0/1     1            0           2s

NAME                                          DESIRED   CURRENT   READY   AGE
replicaset.apps/mysql-deployment-74f5dd5cdf   1         1         0       2s
thor@jump_host ~$ k get all
NAME                                    READY   STATUS    RESTARTS   AGE
pod/mysql-deployment-74f5dd5cdf-g8q4c   1/1     Running   0          15s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP          28s
service/mysql        NodePort    10.96.95.124   <none>        3306:30011/TCP   15s

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql-deployment   1/1     1            1           15s

NAME                                          DESIRED   CURRENT   READY   AGE
replicaset.apps/mysql-deployment-74f5dd5cdf   1         1         1       15s
```

Thank You!!!