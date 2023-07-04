thor@jump_host ~$ kubectl get pods
NAME        READY   STATUS             RESTARTS   AGE
webserver   1/2     ImagePullBackOff   0          2m15s
thor@jump_host ~$ alias k=kubectl
thor@jump_host ~$ k describe pod webserver
```
Name:         webserver
Namespace:    default
Priority:     0
Node:         kodekloud-control-plane/172.17.0.2
Start Time:   Tue, 04 Jul 2023 20:41:40 +0000
Labels:       app=web-app
Annotations:  <none>
Status:       Pending
IP:           10.244.0.5
IPs:
  IP:  10.244.0.5
Containers:
  httpd-container:
    Container ID:   
    Image:          httpd:latests
    Image ID:       
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/log/httpd from shared-logs (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-4bpsr (ro)
  sidecar-container:
    Container ID:  containerd://de732155109d89126d84710848ba9b4d84d7c8171850c9321edeef4fd248132c
    Image:         ubuntu:latest
    Image ID:      docker.io/library/ubuntu@sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do cat /var/log/httpd/access.log /var/log/httpd/error.log; sleep 30; done
    State:          Running
      Started:      Tue, 04 Jul 2023 20:42:00 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/log/httpd from shared-logs (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-4bpsr (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             False 
  ContainersReady   False 
  PodScheduled      True 
Volumes:
  shared-logs:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  default-token-4bpsr:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-4bpsr
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                  From               Message
  ----     ------     ----                 ----               -------
  Normal   Scheduled  3m2s                 default-scheduler  Successfully assigned default/webserver to kodekloud-control-plane
  Normal   Pulling    3m                   kubelet            Pulling image "ubuntu:latest"
  Normal   Pulled     2m55s                kubelet            Successfully pulled image "ubuntu:latest" in 4.802823166s
  Normal   Started    2m42s                kubelet            Started container sidecar-container
  Normal   Created    2m42s                kubelet            Created container sidecar-container
  Warning  Failed     2m16s (x3 over 3m)   kubelet            Error: ErrImagePull
  Normal   BackOff    99s (x5 over 2m40s)  kubelet            Back-off pulling image "httpd:latests"
  Warning  Failed     99s (x5 over 2m40s)  kubelet            Error: ImagePullBackOff
  Normal   Pulling    86s (x4 over 3m1s)   kubelet            Pulling image "httpd:latests"
  Warning  Failed     86s (x4 over 3m)     kubelet            Failed to pull image "httpd:latests": rpc error: code = NotFound desc = failed to pull and unpack image "docker.io/library/httpd:latests": failed to resolve reference "docker.io/library/httpd:latests": docker.io/library/httpd:latests: not found
```
  
thor@jump_host ~$ k get pod webserver -oyaml > pod.yaml
thor@jump_host ~$ vi pod.yaml
thor@jump_host ~$ k replace -f pod.yaml force
pod/webserver replaced
thor@jump_host ~$ k get pods
NAME        READY   STATUS    RESTARTS   AGE
webserver   2/2     Running   0          6m9s
thor@jump_host ~$ 
