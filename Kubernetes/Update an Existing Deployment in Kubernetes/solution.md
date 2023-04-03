#### Update an Existing Deployment in Kubernetes

1. Use alias k as kubectl,

```
thor@jump_host ~$ alias k='kubectl'
```

2. Check the pod, deployment and services status, respectively.

```
thor@jump_host ~$ k get pods 
thor@jump_host ~$ k get deploy
thor@jump_host ~$ k get svc
```

3. Now, edit deployment named `nginx-deployment` and update the following properties,

```
thor@jump_host ~$ k edit deploy nginx-deployment

i)   Change replicas counts from 1 to 5
ii)  Update image from nginx:1.17 to nginx:latest
```

4. Now, edit service `nginx-service`,

```
thor@jump_host ~$ k edit svc nginx-service

i) Change port from 30008 to 32165
```


Thank you.
