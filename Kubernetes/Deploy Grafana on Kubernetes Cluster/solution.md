#### Deploy Grafana on Kubernetes Cluster

1. Change directory to `/home/thor` on jump box,

```
thor@jump_host /$ cd /home/thor/
```

2. Now, create a config file for deployment and service respectively,

```
thor@jump_host ~$ vi grafana-app.yaml
```
*Note: Check current directory for the config*

3. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```


4. Apply the config file, so it will create a deployment and service resepctively,

```
thor@jump_host ~$ k create -f grafana-app.yaml
deployment.apps/grafana-deployment-xfusion created
service/grafana-service-xfusion created
```

5. Check the status of pod, deployment,

```
thor@jump_host ~$ k get all
NAME                                              READY   STATUS    RESTARTS   AGE
pod/grafana-deployment-xfusion-6cb48c97c9-dn92f   1/1     Running   0          5m8s

NAME                              TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/grafana-service-xfusion   NodePort    10.96.105.142   <none>        3000:32000/TCP   6m46s
service/kubernetes                ClusterIP   10.96.0.1       <none>        443/TCP          115m

NAME                                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/grafana-deployment-xfusion   1/1     1            1           9m11s

NAME                                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/grafana-deployment-xfusion-5b8fd886cf   0         0         0       9m11s
replicaset.apps/grafana-deployment-xfusion-6cb48c97c9   1         1         1       5m8s
```

7. Finally, login to grafana dashboard using default credentials, admin/admin,


Thank you.
