#### Kubernetes Shared Volumes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

3. Now, create a `pod.yaml` config,

```
thor@jump_host ~$ vi pod.yaml
```
*Note: Refer same directory for config*

4. Create a a pod,

```
thor@jump_host ~$ k create -f pod.yaml
pod/volume-share-xfusion created
```

5. Check the pod status,

```
thor@jump_host ~$ k get pods
NAME                   READY   STATUS              RESTARTS   AGE
volume-share-xfusion   0/2     ContainerCreating   0          6s

thor@jump_host ~$ kubectl get pod 
NAME                    READY   STATUS    RESTARTS   AGE
volume-share-xfusion   2/2     Running   0          16s
```

6. Now get a shell into `volume-container-xfusion-1` and create a beta.txt file as described in problem statement,

```
thor@jump_host ~$ kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 -- /bin/bash
root@volume-share-xfusion:/# echo "this is a test file" > /tmp/ecommerce/ecommerce.txt

[root@volume-share-nautilus /]# ls -ltr /tmp/ecommerce/
total 4
-rw-r--r-- 1 root root 20 Mar 19 13:08 ecommerce.txt

[root@volume-share-nautilus /]# cat /tmp/ecommerce/ecommerce.txt 
this is a test file
```

7. Once you exit out of a container, now get a shell into `volume-container-xfusion-2` and check if you can see the ecommerce.txt file is present or not!

```
thor@jump_host ~$ kubectl exec -it volume-share-xfusion -c volume-container-xfusion-2 -- /bin/bash
root@volume-share-xfusion:/# cat /tmp/apps/ecommerce.txt 
this is a test file
```

Thank you.
