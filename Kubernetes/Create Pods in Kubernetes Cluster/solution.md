#### Create Pods in Kubernetes Cluster

1. Change directroy to `/home/thor` on jump host,

```
thor@jump_host /$ cd /home/thor/
```

2. Make a alias of `kubectl` as k,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Here, we will do a different way rather than writing it from scratch, Will generate a manifest and update it slitely to meet our needs. 

```
thor@jump_host ~$ k run pod-httpd --image httpd:latest --labels app=httpd_app --dry-run=client -oyaml > pod.yaml

thor@jump_host ~$ vi pod.yaml
```
*Note: After updating you can find it in the same directroy.*

4. Now, create a pod usign `kubectl create` utility,

```
hor@jump_host ~$ k create -f pod.yaml
pod/pod-httpd created
```

5. Check the pod and labels respectively, 

```
thor@jump_host ~$ k get pods
NAME        READY   STATUS    RESTARTS   AGE
pod-httpd   1/1     Running   0          40s

thor@jump_host ~$ k get pods --show-labels
NAME        READY   STATUS    RESTARTS   AGE   LABELS
pod-httpd   1/1     Running   0          61s   app=httpd_app

```

6. Also, validate `container-name` using kubectl describe command,

```
thor@jump_host ~$ k describe pod pod-nginx
...
...
...	
Containers:
  httpd-container:
    Container ID:   containerd://3fa9e39fc6ada511de0fad497f0b127ba88a4fc3cf465c432a292c5cbd22d03b
    Image:          httpd:latest
    Image ID:       docker.io/library/httpd@sha256:87a012bf99bf5e3e0f628ac1f69abbeab534282857fba3a359ca3a3f4a02429a
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Sun, 22 Jan 2023 10:39:44 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-qzddr (ro)
...
...
...
```

## Thank you.
