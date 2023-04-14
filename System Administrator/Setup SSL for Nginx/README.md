#### Setup SSL for Nginx

System admins team of xFusionCorp Industries needs to deploy a new application on App Server 1 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. As per requirements shared below prepare the server:


Install and configure nginx on App Server 1.

On App Server 1 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.

Create an index.html file with content Welcome! under Nginx document root.

For final testing try to access the App Server 1 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/