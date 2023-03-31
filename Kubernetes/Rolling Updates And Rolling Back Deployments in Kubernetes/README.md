#### Rolling Updates And Rolling Back Deployments in Kubernetes

There is a production deployment planned for next week. The Nautilus DevOps team want to test the deployment update and rollback on Dev environment first so that they can identify the risks in advance. Below you can find more details about the plan they want to execute.


Create a namespace `nautilus`. Create a deployment called `httpd-deploy` under this new namespace, It should have one container called `httpd`, use `httpd:2.4.25` image and `2` replicas. The deployment should use `RollingUpdate` strategy with `maxSurge=1`, and `maxUnavailable=2`. Also create a `NodePort` type service named `httpd-service` and expose the deployment on `nodePort: 30008`.

Now upgrade the deployment to version `httpd:2.4.43` using a rolling update.

Finally, once all pods are updated undo the recent update and roll back to the previous/original version.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.
