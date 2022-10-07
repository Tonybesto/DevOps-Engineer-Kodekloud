## **Creating a Deployment on kuberenetes cluster**

* Make use of shortcut for kubectl utility to make things easy.

**`alias k=kubectl`**

![alias](./Images/alias%20kubectl.PNG)

* Check the cluster for available pods and deployment

![available pods](./Images/Get%20pods.PNG)

* Create a deployment in the cluster named nginx with image nginx:latest.. make sure the tag is supplied 


**`Kubectl create deployment ngninx --image=nginx:latest`**


![create deployment](./Images/create%20deployment.PNG)

* Check if the deployment was successful using:

**`Kubectl get deployment`**

![Get deployment](./Images/get%20deployment.PNG)

* Describe the deployment using:

**`Kubectl describe deployment`** 

![Describe deployment](./Images/describe%20deployment.PNG)




