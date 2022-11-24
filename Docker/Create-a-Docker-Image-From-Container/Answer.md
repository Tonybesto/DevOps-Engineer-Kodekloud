login into the application server stated in the Question

**`ssh tony@stapp01`**


![ssh login](./Images/ssh%20into%20app%20server.png)

Change to the root user


**`sudo su -`**

![root user](./Images/Root%20User.png)


Check the docker containers present 

**`docker ps -a`**


![Docker ps](./Images/docker%20ps.png)

check the docker images present

**`docker images`**

![Docker Images](./Images/docker%20images.png)


From the task we are to create an image apps:devops on application server 1 from a container ubuntu_latest 

**`docker commit ubuntu_latest apps:devops`**

![Docker create](./Images/Image%20app-devops.png)

check the images available our new container should be available and running on server 1

**`docker images`**

![Docker images](./Images/images%20app%20check.png)