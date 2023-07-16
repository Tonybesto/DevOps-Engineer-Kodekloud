#### Fix issue with PhpFpm Application Deployed on Kubernetes

1. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

2. Check the labels on pods, we can tag `app=nginx-fpm` is attached,

```
thor@jump_host /$ k get pods --show-labels
NAME                               READY   STATUS    RESTARTS   AGE     LABELS
nginx-phpfpm-dp-778fb84448-kvhh4   2/2     Running   0          7m30s   app=nginx-fpm,pod-template-hash=778fb84448,tier=frontend
```

3. Check the nginx service we can see the port is not default http port, hence change the port and targetPOrt to 80. Also, check tag used in there. We can see the config after updating port and tag,

```
thor@jump_host ~$ k get svc nginx-service -o yaml

# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: v1
kind: Service
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"app":"nginx-fpm"},"name":"nginx-service","namespace":"default"},"spec":{"ports":[{"nodePort":30008,"port":80}],"selector":{"app":"nginx-fpm","tier":"frontend"},"type":"LoadBalancer"}}
  creationTimestamp: "2023-07-16T21:16:43Z"
  labels:
    app: nginx-fpm
  name: nginx-service
  namespace: default
  resourceVersion: "4954"
  uid: 87ada3b2-b3fa-4a01-a1d4-964b71009c0d
spec:
  clusterIP: 10.96.68.81
  clusterIPs:
  - 10.96.68.81
  externalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - nodePort: 30008
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx-fpm
    tier: frontend
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer: {}
```
  
4. Check the node IP address,

```  
thor@jump_host ~$ k get nodes -o wide
NAME           STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION       CONTAINER-RUNTIME
controlplane   Ready    master   12m   v1.16.4   172.17.0.8    <none>        Ubuntu 18.04.4 LTS   4.15.0-109-generic   docker://19.3.6
node01         Ready    <none>   11m   v1.16.0   172.17.0.9    <none>        Ubuntu 18.04.4 LTS   4.15.0-109-generic   docker://19.3.6
```


thor@jump_host ~$ kubectl get pod
NAME                               READY   STATUS    RESTARTS   AGE
nginx-phpfpm-dp-5cccd45499-ghgrz   2/2     Running   0          21m

thor@jump_host ~$ kubectl cp /tmp/index.php nginx-phpfpm-dp-5cccd45499-ghgrz:/var/www/html -c nginx-container

thor@jump_host ~$ kubectl exec -it nginx-phpfpm-dp-5cccd45499-ghgrz -c nginx-container -- bash

5. We can check the application on port 30008 from browser or using curl,

```
thor@jump_host ~$ curl 172.17.0.9:30008
<!DOCTYPE html>
<html>
<head><title>Welcome to nginx!</title>
<style>    
body {        width: 35em;        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;    }
</style>
</head>
<body><h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

Thank you.





thor@jump_host ~$ alias k=kubectl
thor@jump_host ~$ k get deployment
NAME              READY   UP-TO-DATE   AVAILABLE   AGE
nginx-phpfpm-dp   1/1     1            1           74s
thor@jump_host ~$ k get cm
NAME               DATA   AGE
kube-root-ca.crt   1      41m
nginx-config       1      88s
thor@jump_host ~$ k get svc
NAME            TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
kubernetes      ClusterIP      10.96.0.1     <none>        443/TCP          42m
nginx-service   LoadBalancer   10.96.68.81   <pending>     8097:30008/TCP   104s
thor@jump_host ~$ k describe nginx-config
error: the server doesn't have a resource type "nginx-config"
thor@jump_host ~$ k describe cm nginx-config
Name:         nginx-config
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
nginx.conf:
----
events {
}
http {
  server {
    listen 80 default_server;
    listen [::]:80 default_server;

    # Set nginx to serve files from the shared volume!
    root /var/www/html;
    index  index.html index.ph p index.htm;
    server_name _;
    location / {
      try_files $uri $uri/ =404;
    }
    location ~ \.php$ {
      include fastcgi_params;
      fastcgi_param REQUEST_METHOD $request_method;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      fastcgi_pass 127.0.0.1:9000;
    }
  }
}

Events:  <none>
thor@jump_host ~$ k edit svc nginx-service
service/nginx-service edited
thor@jump_host ~$ k edit cm nginx-config
configmap/nginx-config edited
thor@jump_host ~$ k get pods
NAME                               READY   STATUS    RESTARTS   AGE
nginx-phpfpm-dp-5cccd45499-r4pdh   2/2     Running   0          4m38s
thor@jump_host ~$ k describe pod
```
Name:         nginx-phpfpm-dp-5cccd45499-r4pdh
Namespace:    default
Priority:     0
Node:         kodekloud-control-plane/172.17.0.2
Start Time:   Sun, 16 Jul 2023 21:16:44 +0000
Labels:       app=nginx-fpm
              pod-template-hash=5cccd45499
              tier=frontend
Annotations:  <none>
Status:       Running
IP:           10.244.0.5
IPs:
  IP:           10.244.0.5
Controlled By:  ReplicaSet/nginx-phpfpm-dp-5cccd45499
Containers:
  nginx-container:
    Container ID:   containerd://4fbf32b3436edd3245b235f2ab2222c18a823aaa8cd5033d6252c1e571b915b0
    Image:          nginx:latest
    Image ID:       docker.io/library/nginx@sha256:08bc36ad52474e528cc1ea3426b5e3f4bad8a130318e3140d6cfe29c8892c7ef
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sun, 16 Jul 2023 21:16:58 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/nginx/nginx.conf from nginx-config-volume (rw,path="nginx.conf")
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-xccdw (ro)
      /var/www/html from shared-files (rw)
  php-fpm-container:
    Container ID:   containerd://d154a7f922c193628b1d44b469525a680bdebe6bc8e1c1f68ac99a072caa60ef
    Image:          php:7.3-fpm
    Image ID:       docker.io/library/php@sha256:2d68e401d2d3b9f8a6572791cd7a25062450c43ff52e58391146809741ad0885
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sun, 16 Jul 2023 21:17:21 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-xccdw (ro)
      /var/www/html from shared-files (rw)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  nginx-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  nginx-pv-claim
    ReadOnly:   false
  shared-files:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  nginx-config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-config
    Optional:  false
  default-token-xccdw:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-xccdw
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  5m5s   default-scheduler  Successfully assigned default/nginx-phpfpm-dp-5cccd45499-r4pdh to kodekloud-control-plane
  Normal  Pulling    5m3s   kubelet            Pulling image "nginx:latest"
  Normal  Pulled     4m52s  kubelet            Successfully pulled image "nginx:latest" in 11.459479561s
  Normal  Created    4m52s  kubelet            Created container nginx-container
  Normal  Started    4m51s  kubelet            Started container nginx-container
  Normal  Pulling    4m51s  kubelet            Pulling image "php:7.3-fpm"
  Normal  Pulled     4m28s  kubelet            Successfully pulled image "php:7.3-fpm" in 23.278752398s
  Normal  Created    4m28s  kubelet            Created container php-fpm-container
  Normal  Started    4m28s  kubelet            Started container php-fpm-container
```
thor@jump_host ~$ k cp /tmp/index.php nginx-phpfpm-dp-5cccd45499-r4pdh:/var/www/html -c nginx-container
thor@jump_host ~$ k logs nginx-phpfpm-dp-5cccd45499-r4pdh -c nginx-container
```
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/07/16 21:24:09 [error] 80#80: *1 directory index of "/var/www/html/" is forbidden, client: 10.244.0.1, server: _, request: "GET / HTTP/1.1", host: "30008-port-213bf3769f3c481e.labs.kodekloud.com", referrer: "https://213bf3769f3c481e.labs.kodekloud.com/"
10.244.0.1 - - [16/Jul/2023:21:24:09 +0000] "GET / HTTP/1.1" 403 555 "https://213bf3769f3c481e.labs.kodekloud.com/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"

```
thor@jump_host ~$ k logs nginx-phpfpm-dp-5cccd45499-r4pdh -c php-fpm-container
[16-Jul-2023 21:17:21] NOTICE: fpm is running, pid 1
[16-Jul-2023 21:17:21] NOTICE: ready to handle connections
thor@jump_host ~$ k rollout restart deployment nginx-phpfpm-dp
deployment.apps/nginx-phpfpm-dp restarted
thor@jump_host ~$ k get pods
NAME                               READY   STATUS              RESTARTS   AGE
nginx-phpfpm-dp-55cc57d8fc-4nh2d   0/2     ContainerCreating   0          1s
thor@jump_host ~$ k get pods -w
NAME                               READY   STATUS    RESTARTS   AGE
nginx-phpfpm-dp-55cc57d8fc-4nh2d   2/2     Running   0          5s
^Cthor@jump_host ~$ k get svc 
NAME            TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes      ClusterIP      10.96.0.1     <none>        443/TCP        53m
nginx-service   LoadBalancer   10.96.68.81   <pending>     80:30008/TCP   13m
thor@jump_host ~$ k edit svc nginx-service
Edit cancelled, no changes made.
thor@jump_host ~$ k cp /tmp/index.php nginx-phpfpm-dp-55cc57d8fc-4nh2d:/var/www/html -c nginx-container