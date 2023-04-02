#### Init Containers in Kubernetes

There are some applications that need to be deployed on Kubernetes cluster and these apps do have some pre-requisites where some configuration need to be changes before deploying the app container. Some of these changes can not be made inside the images so DevOps team has come up with a solution to use init containers to perform these tasks during deployment. Below is a sample scenario team is going to test first.


Create a `Deployment` named as `ic-deploy-xfusion`.

Configure `spec` as replicas should be `1`, labels `app` should be `ic-xfusion`, template's metadata lables `app` should be same `ic-xfusion`.

The `initContainers` should be names as `ic-msg-xfusion`, use image `fedora`, preferably with `latest` tag and use command `'/bin/bash', '-c'` and `'echo Init Done - Welcome to xFusionCorp Industries > /ic/ecommerce'`. The volume mount should be named as `ic-volume-xfusion` and mount path should be `/ic`.

Main container should be named as `ic-main-xfusion`, use image `fedora`, preferably with `latest` tag and use command `'/bin/bash', '-c'` and `'while true; do cat /ic/ecommerce; sleep 5; done'`. The volume mount should be named as `ic-volume-xfusion` and mount path should be `/ic`.

Volume to be named as `ic-volume-xfusion` and it should be an emptyDir type.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.
