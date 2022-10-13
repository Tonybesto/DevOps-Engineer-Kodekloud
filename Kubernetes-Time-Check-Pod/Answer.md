First we need to check if the Kubectl utility is working using the command below:

**`kubectl`**

we check the namespaces given using the command:

**`kubectl get namespace`**

![Get namespace](./Images/Kubectl%20get%20namespace.png)

we create a new namespace as directed by the task **(namespace nautilus)** using the command:

**`kubectl create namespace nautilus`**

![Create namespace](./Images/Create%20namespace.png)

Once the Namespace is created, we need to create a pod with a yaml file.

1. **`vi /tmp/time.yaml`**

2. Copy and paste the file from  	[time-pod](https://github.com/Tonybesto/DevOps-Engineer-Kodekloud/blob/main/Kubernetes%20Time%20Check%20Pod/Kubernetes-Time-Check-Pod.md)

![Time Pod](./Images/Time%20yaml.png)


**Note** As per task change **namespace**, **pod name**, **image**, **configmap** and **mountpath**

3. Save and close the vi editor using **`:wq`**

4. Create the pod using:

    **`kubectl apply -f /tmp/time.yaml`**

5. To check if the pod is running:

    **`kubectl get pod -n nautilus`**

![create Pod](./Images/Create%20and%20get%20Pod.png)

6. To check if the pod is working fine, exec into the pod using the command:

    **`kubectl exec time-check --namespace=nautilus -- cat /opt/finance/time/time-check.log`**

    ![Exec Pod](./Images/Exec%20Into%20pod.png)


    ## **After this process the task is complete!!!**
