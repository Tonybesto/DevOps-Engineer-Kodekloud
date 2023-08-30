#### Deploy Tomcat App on Kubernetes

1. Change directory to `/home/thor` on jump box,

```
cd /home/thor/
```

2. Now, create a config file for deployment and service respectively,

```
vi tomcat.yaml
```
*Note: Check current directory for the config*

3. Use alias k as kubectl,

```
alias k='kubectl'
```

4. Create a namespace `tomcat-namespace-datacenter`,

```
k create ns tomcat-namespace-datacenter
namespace/tomcat-namespace-datacenter created
```

5. Now, apply the config file which will create a deployment and service respectively.

```
k create -f tomcat.yaml

deployment.apps/tomcat-deployment-datacenter created
service/tomcat-service-datacenter created
```

6. Check the pods and deployment status,

```
k get deploy -n tomcat-namespace-datacenter

NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
tomcat-deployment-datacenter   0/1     1            0           13s

k get po -n tomcat-namespace-datacenter

NAME                                         READY   STATUS              RESTARTS   AGE
tomcat-deployment-datacenter-5bd7cf974b-rq2bk   0/1     ContainerCreating   0          20s

k get po -n tomcat-namespace-datacenter
NAME                                         READY   STATUS    RESTARTS   AGE
tomcat-deployment-datacenter-5bd7cf974b-rq2bk   1/1     Running   0          29s

k get deploy -n tomcat-namespace-datacenter
NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
tomcat-deployment-datacenter   1/1     1            1           33s
```














