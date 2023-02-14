#### Deploy Node App on Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```


3. Create a file node-app.yaml for writing a deployment and service manifest,

```
thor@jump_host ~$ vi node-app.yaml
```
*Note: Refer same directory for config*

4. Create a deployment and service respectively,

```
thor@jump_host ~$ k create -f node-app.yaml
deployment.apps/node-deployment-nautilus created
service/node-service-nautilus created
```

6. Check the pod, deployment status,

```
thor@jump_host ~$ k get pods
NAME                                        READY   STATUS    RESTARTS   AGE
node-deployment-nautilus-7794fdd768-j7bj5   1/1     Running   0          72s
node-deployment-nautilus-7794fdd768-jv5lm   1/1     Running   0          72s

thor@jump_host ~$ k get deployment 
NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
node-deployment-nautilus   0/2     2            0           7s

thor@jump_host ~$ k get svc
NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes              ClusterIP   10.96.0.1       <none>        443/TCP        24m
node-service-nautilus   NodePort    10.96.150.117   <none>        80:30012/TCP   6s
```

Thank you.

