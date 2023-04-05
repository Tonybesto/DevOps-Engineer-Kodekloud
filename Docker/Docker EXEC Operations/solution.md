#### Docker EXEC Operations

SSH to App Server 3 and check the running docker container using a command,

  [root@stapp03 ~]# docker container ls
CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS         PORTS     NAMES
43e0927d5cac   ubuntu:18.04   "/bin/bash"   3 minutes ago   Up 2 minutes             kkloud

Now get a shell inside of a running container using, 

    docker container exec -it 43e0927d5cac /bin/bash

Now you are inside a container, install apache2 using apt package manager,

    apt install apache2

Install vim editor for editing config file,

    apt install vim

Finally, change the port in `/etc/apache2/ports.conf` file from 80 to 5002 respectively and restart the apache2 service.

```
service apache2 start

service apache2 status
```

Then, check locally inside the container using curl call,

    root@43e0927d5cac:/# curl localhost:5002

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <!--
        Modified from the Debian original for Ubuntu
        Last updated: 2016-11-16
        See: https://launchpad.net/bugs/1288690
      -->
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Apache2 Ubuntu Default Page: It works</title>
        <style type="text/css" media="screen">
      * {
        margin: 0px 0px 0px 0px;
        padding: 0px 0px 0px 0px;
      }

      body, html {
        padding: 3px 3px 3px 3px;

        background-color: #D8DBE2;
     .....
     .....

Thank you.
