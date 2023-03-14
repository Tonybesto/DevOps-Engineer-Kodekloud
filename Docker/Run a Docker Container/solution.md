#### Run a Docker Container

SSH to App server3 and run an nginx container using nginx:alpine docker image using the following command,
```
[root@stapp03 ~]# docker container run -d --name nginx_3 nginx:alpine
Unable to find image 'nginx:alpine' locally
alpine: Pulling from library/nginx
63b65145d645: Pull complete 
8c7e1fd96380: Pull complete 
86c5246c96db: Pull complete 
b874033c43fb: Pull complete 
dbe1551bd73f: Pull complete 
0d4f6b3f3de6: Pull complete 
2a41f256c40f: Pull complete 
Digest: sha256:6318314189b40e73145a48060bff4783a116c34cc7241532d0d94198fb2c9629
Status: Downloaded newer image for nginx:alpine
5f21d014d49314a78ea88a532681ca2511854caff6836651ff9b4d52ac0e54bb
```

Verify that a container is running using a command,

[root@stapp03 ~]# docker container ls
```
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS     NAMES
5f21d014d493   nginx:alpine   "/docker-entrypoint.…"   About a minute ago   Up About a minute   80/tcp    nginx_3
```

Thank you.
