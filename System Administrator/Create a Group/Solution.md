1. ssh into App server 1
   
thor@jump_host ~$ ssh tony@stapp01

2. Change to the root user
   
[tony@stapp01 ~]$ sudo su -

3. Create group named `nautilus_sftp_users`
   
[root@stapp01 ~]# groupadd nautilus_sftp_users

4. Add user to group
 
[root@stapp01 ~]# useradd -G nautilus_sftp_users mohammed

5. Confirm that user has been created

[root@stapp01 ~]# id mohammed
uid=1002(mohammed) gid=1003(mohammed) groups=1003(mohammed),1002(nautilus_sftp_users)


[root@stapp01 ~]# exit 

Repeat steps for the remaining servers

Thank You!!