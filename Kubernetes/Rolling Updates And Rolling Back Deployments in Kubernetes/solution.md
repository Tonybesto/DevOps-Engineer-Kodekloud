#### Rolling Updates And Rolling Back Deployments in Kubernetes

1. Change the directory to `thor` on jump host,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a namespace `nautilus` using kubectl utility,

```
thor@jump_host ~$ kubectl create namespace xfusion
namespace/nautilus created
```

3. Now create a deployment manifest,

```
thor@jump_host ~$ vi deployment.yml
```
*Note: Check the current directory for the same*

4. Apply and create a deployment,

```
thor@jump_host ~$ kubectl create -f deployment.yml
deployment.apps/httpd-deploy created
```

5. Check the deployment and pod status,

```
thor@jump_host ~$ kubectl get deployments -n nautilus
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
httpd-deploy   0/2     2            0           11s

thor@jump_host ~$ kubectl get pods -n nautilus
NAME                            READY   STATUS              RESTARTS   AGE
httpd-deploy-6549f89657-7pqvk   0/1     ContainerCreating   0          16s
httpd-deploy-6549f89657-8p5kk   0/1     ContainerCreating   0          17s
```

6. Now we need to upgrade the deployment, we can do using two way, one is set image and other way by editing deployment, In this example, I'll be using later, edit deployment and update the image to `2.4.43` ,
```
thor@jump_host ~$ kubectl edit deployment httpd-deploy -n nautilus
deployment.apps/httpd-deploy edited
```

7. Now, check the pod status,

```
thor@jump_host ~$ kubectl get pods -n nautilus
NAME                            READY   STATUS              RESTARTS   AGE
httpd-deploy-6549f89657-8p5kk   1/1     Running             0          2m23s
httpd-deploy-6549f89657-cn9f7   1/1     Running             0          2m22s
```

8. Check the rollout history, it's not recording we see none in there,

```
thor@jump_host ~$ kubectl rollout history deployment httpd-deploy -n xfusion
deployment.apps/httpd-deploy
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

9. Once , all pods are in running state, rollback the deployment to the previous version, i.e. `2.4.25` by using rollout undo,

```
thor@jump_host ~$ kubectl rollout undo deployment httpd-deploy -n nautilus
deployment.apps/httpd-deploy rollback
```

10. Now, check the pods and deployments status respecticely.

Thank you.
