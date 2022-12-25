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
...
...
...
     State:          Running
      Started:      Sun, 25 Dec 2022 21:28:02 +0000
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
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-mxs5j (ro)
...
...
...
```

Thank you.
