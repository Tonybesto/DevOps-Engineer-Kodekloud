#### Countdown job in Kubernetes

The Nautilus DevOps team is working on to create few jobs in Kubernetes cluster. They might come up with some real scripts/commands to use, but for now they are preparing the templates and testing the jobs with dummy commands. Please create a job template as per details given below:


Create a job `countdown-devops`.

The spec template should be named as `countdown-devops` (under metadata), and the container should be named as `container-countdown-devops`

Use image `centos` with `latest` tag only and remember to mention tag i.e `centos:latest`, and restart policy should be `Never`.

Use command for `for i in ten nine eight seven six five four three two one ; do echo $i ; done`

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

