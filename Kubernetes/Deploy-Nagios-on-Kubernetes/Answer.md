## **Deploying Nagios on Kubernetes**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nagios-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nagios-core
  template:
    metadata:
      labels:
        app: nagios-core
    spec:
      containers:
        - name: nagios-container
          image: jasonrivers/nagios

---
apiVersion: v1
kind: Service
metadata:
  name: nagios-service
spec:
  type: NodePort
  selector:
    app: nagios-core
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30008
```


 kubectl get pods

kubectl exec -it nagios-deployment-6674945696-mvxzg -- /bin/bash