thor@jump_host ~$ ssh steve@stapp02

The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ECDSA key fingerprint is SHA256:lveob+4R4wTkeltTxHwaUBqoNoI+79RdoccItuGyaws.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02,172.16.238.11' (ECDSA) to the list of known hosts.
steve@stapp02's password: 

login as the root user 

[steve@stapp02 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve:


[root@stapp02 ~]# docker ps 
```
CONTAINER ID        IMAGE               COMMAND               CREATED              STATUS              PORTS               NAMES
79521befe723        busybox             "tail -f /dev/null"   About a minute ago   Up About a minute                       kke-container
```

[root@stapp02 ~]# docker stop 7952
7952
[root@stapp02 ~]# docker ps 
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

[root@stapp02 ~]# docker images 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busybox             latest              a416a98b71e2        2 months ago        4.26MB
[root@stapp02 ~]# docker ps  -a

```
CONTAINER ID        IMAGE               COMMAND               CREATED             STATUS                        PORTS               NAMES
79521befe723        busybox             "tail -f /dev/null"   3 minutes ago       Exited (137) 28 seconds ago                       kke-container
```

[root@stapp02 ~]# docker rm 7952
7952
[root@stapp02 ~]# docker ps  -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES