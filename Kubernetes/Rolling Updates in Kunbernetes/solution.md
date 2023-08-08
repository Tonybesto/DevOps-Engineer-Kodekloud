#### Rolling Updates in Kubernetes

1. As deployment is already created and pods are running, edit the deployment usign the following command,

```
thor@jump_host ~$ kubectl edit deployment nginx-deployment
deployment.apps/nginx-deployment edited
```

Update the docker image to nginx:1.17 in above file.

2. Check the pods status,

```
thor@jump_host /$ kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
nginx-deployment-5f7f57d56b-d5xlp   1/1     Running             0          2m28s
nginx-deployment-5f7f57d56b-ph5fk   1/1     Running             0          2m28s
nginx-deployment-5f7f57d56b-x976l   1/1     Running             0          2m28s
nginx-deployment-64b96db897-g9vsl   0/1     ContainerCreating   0          4s
```

3. Check the rollout status using the command,

```
thor@jump_host /$ kubectl rollout status deployment/nginx-deployment
deployment "nginx-deployment" successfully rolled out
```

4. Check rollout history using the command,

```
thor@jump_host /$ kubectl rollout history deployment nginx-deployment
deployment.apps/nginx-deployment
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```
5. Again, check the pod status,

```
thor@jump_host /$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-64b96db897-csp6r   1/1     Running   0          77s
nginx-deployment-64b96db897-dkwl4   1/1     Running   0          75s
nginx-deployment-64b96db897-g9vsl   1/1     Running   0          84s
```

6. Finally confirm that it uses the `RollingUpdate` strategy correctly, using command,

```
thor@jump_host /$kubectl describe deployment nginx-deployment
Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Thu, 05 Jan 2023 19:50:49 +0000
Labels:                 app=nginx-app
                        type=front-end
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=nginx-app
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx-app
  Containers:
   nginx-container:
    Image:        nginx:1.17
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-deployment-576b8f48fb (3/3 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  5m49s  deployment-controller  Scaled up replica set nginx-deployment-74fb588559 to 3
  Normal  ScalingReplicaSet  2m18s  deployment-controller  Scaled up replica set nginx-deployment-576b8f48fb to 1
  Normal  ScalingReplicaSet  2m8s   deployment-controller  Scaled down replica set nginx-deployment-74fb588559 to 2
  Normal  ScalingReplicaSet  2m8s   deployment-controller  Scaled up replica set nginx-deployment-576b8f48fb to 2
  Normal  ScalingReplicaSet  2m6s   deployment-controller  Scaled down replica set nginx-deployment-74fb588559 to 1
  Normal  ScalingReplicaSet  2m5s   deployment-controller  Scaled up replica set nginx-deployment-576b8f48fb to 3
  Normal  ScalingReplicaSet  2m2s   deployment-controller  Scaled down replica set nginx-deployment-74fb588559 to 0
```

Thank you.
