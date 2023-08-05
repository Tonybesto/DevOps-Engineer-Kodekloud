#### Set Limits for Resources in Kubernetes

1. Change directory to `/home/thor`,

```
thor@jump_host ~$ cd /home/thor
```

2. Create a `pod.yml` manifest file. Refer in the same directroy.

3. Apply and create a pod from the above manifest,

```
thor@jump_host ~$ kubectl create -f pod.yml
pod/httpd-pod created
```

4. Check the pod status,

```
thor@jump_host ~$ kubectl get pods
NAME        READY   STATUS              RESTARTS   AGE
httpd-pod   0/1     ContainerCreating   0          13s

thor@jump_host ~$ kubectl get pods
NAME        READY   STATUS    RESTARTS   AGE
httpd-pod   1/1     Running   0          21s
```

5. Verify that the limits for resources are applied correctly using describe command,

```
thor@jump_host ~$ kubectl describe pod httpd-pod

Name:             httpd-pod
Namespace:        default
Priority:         0
Service Account:  default
Node:             kodekloud-control-plane/172.17.0.2
Start Time:       Sat, 05 Aug 2023 07:58:10 +0000
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.0.5
IPs:
  IP:  10.244.0.5
Containers:
  httpd-container:
    Container ID:   containerd://8ce4fa6ffe00205c31ad828369d5a6b279467fe5110707391eb4bfb4d8932c54
    Image:          httpd:latest
    Image ID:       docker.io/library/httpd@sha256:d7262c0f29a26349d6af45199b2770d499c74d45cee5c47995a1ebb336093088
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sat, 05 Aug 2023 07:58:19 +0000
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:     100m
      memory:  20Mi
    Requests:
      cpu:        100m
      memory:     15Mi
    Environment:  <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-666mn (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-666mn:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  54s   default-scheduler  Successfully assigned default/httpd-pod to kodekloud-control-plane
  Normal  Pulling    53s   kubelet            Pulling image "httpd:latest"
  Normal  Pulled     46s   kubelet            Successfully pulled image "httpd:latest" in 7.727450571s (7.727469457s including waiting)
  Normal  Created    46s   kubelet            Created container httpd-container
  Normal  Started    45s   kubelet            Started container httpd-container
```

Thank you.
