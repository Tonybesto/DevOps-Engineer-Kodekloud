#### Docker Ports Mapping

SSH to App server3 and as mentioned in task a, pull docker image `nginx:alpine-perl` using the following command,

`docker image pull nginx:alpine-perl`

Now create a container out of the image and assign it a friendly name as `ecommerce` and map port `6400` from host machine to container port `80`, use the following command,

`docker container run -d --name ecommerce -p 6400:80 nginx:alpine-perl`

Now, you can validate by requesting to nginx server over the host port 8085, using the following command,

[banner@stapp03 ~]$ curl localhost:6400
```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
As well as we have run a container in deamon mode so it will be in a running state. Validate using the command, 

   [banner@stapp03 ~]$ sudo docker ps
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS          PORTS                  NAMES
1933672a5591   nginx:alpine-perl   "/docker-entrypoint.…"   12 seconds ago   Up 10 seconds   0.0.0.0:6400->80/tcp   ecommerce

Thank you.
