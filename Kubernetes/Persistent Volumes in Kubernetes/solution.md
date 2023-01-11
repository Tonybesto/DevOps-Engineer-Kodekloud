#### Persistent Volumes in Kubernetes

1. Change directory to `/home/thor` on jump_host,

```
thor@jump_host ~$ cd /home/thor
```

2. First create a persistent volume and persistent volume claim manifest for manual storage,

```
thor@jump_host ~$ vi pv.yml
thor@jump_host ~$ vi pvc.yml
```

3. Apply the manifest which will create a PV and PVC,

```
thor@jump_host ~$ kubectl create -f .
persistentvolume/pv-datacenter created
persistentvolumeclaim/pvc-datacenter created
```

4. Now create pod config,

```
thor@jump_host ~$ vi pod1.yml
```

5. Create pod usign the kubectl which will monut a volume we created above,

```
thor@jump_host ~$ kubectl create -f pod.yml
pod/pod-nautilus created
```

6. Now, check the status of pod, pv and pvc respectively.

```
thor@jump_host ~$ kubectl get pv
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE
pv-datacenter   4Gi        RWO            Retain           Bound    default/pvc-nautilus   manual                  17s

thor@jump_host ~$ kubectl get pvc
NAME           STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-datacenter   Bound    pv-nautilus   4Gi        RWO            manual         22s

thor@jump_host ~$ kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
pod-datacenter   1/1     Running   0          30s
```

7. Create service of Nodeport
```
thor@jump_host ~$ vi service.yaml
```

8. Apply the manifest which will create a service 

```
thor@jump_host ~$ kubectl create -f service.yaml
service/web-datacenter created
```





