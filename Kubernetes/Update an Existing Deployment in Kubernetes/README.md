#### Update an Existing Deployment in Kubernetes

There is an application deployed on Kubernetes cluster. Recently Nautilus application development team developed a new version of the application that needs to be deployed now. As per new updates some new changes need to be made in this existing setup. So update the deployment and service as per details mentioned below:

We already have a deployment named `nginx-deployment` and service named `nginx-service`. Some changes need to be made in this deployment and service, make sure not to delete the deployment and service.

1.) Change the service nodeport from `30008` to `32165`

2.) Change replicas count from `1` to `5`

3.) Change the image from `nginx:1.17` to `nginx:latest`

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.
