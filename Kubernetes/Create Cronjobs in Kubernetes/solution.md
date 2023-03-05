#### Create Cronjobs in Kubernetes

1. Change directory to `/home/thor` on jump server,

```
thor@jump_host /$ cd /home/thor/
```

2. Create a file `cron.yaml`, 

```
thor@jump_host ~$ vi cron.yaml
```

3. Use alias k as kubectl utility,

```
thor@jump_host ~$ alias k='kubectl'
```

4. Apply the cronjob manifest,

```
thor@jump_host ~$ k create -f cron.yaml
cronjob.batch/xfusion created
```

5. Now, check the status of cronjob,

```
thor@jump_host ~$ k get cronjob
NAME     SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
xfusion   */5 * * * *   False     0        <none>          7s

thor@jump_host ~$ k get cronjob  xfusion
NAME     SCHEDULE      SUSPEND   ACTIVE   LAST SCHEDULE   AGE
xfusion   */5 * * * *   False     0        <none>          13s
```

6. As we can see from above results that cron job has not scheduled or run any job yet. Watch for the job to be created in around five minute:

```
thor@jump_host ~$ kubectl get jobs --watch
NAME                 COMPLETIONS   DURATION   AGE
xfusion-1678052700   0/1           6s         6s
xfusion-1678052700   1/1           13s        13s
```

7. We can see that cron job `xfusion` successfully scheduled a job at the time specified in `LAST SCHEDULE`
   Now, find the pods that the last scheduled job created and view the standard output of one of the pods.
   Note: The job name and pod name are different.

```
thor@jump_host ~$ pods=$(kubectl get pods --selector=job-name=xfusion-1678053000 --output=jsonpath={.items[*].metadata.name})
```

8. Finally, check the pod logs,

```
thor@jump_host ~$ kubectl logs $pods
Welcome to xfusioncorp!
```

This validates the string we echo into cron configuration works as expected.

Thank you.
