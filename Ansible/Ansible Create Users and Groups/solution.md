#### Ansible Create Users and Groups

1. Change directory to `playbook` and check the contents on jump box,

```
thor@jump_host /$ cd /home/thor/playbook/
```

2. Now, check an `inventory` file and verify the hosts as below,

```
thor@jump_host ~/ansible$ cat inventory
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

3. Verify the users list as mentioned in the `users.yml` file,

```
thor@jump_host ~/playbooks$ cat data/users.yml 
admins:
  - rob
  - david
  - joy

developers:
  - tim
  - ray
  - jim
  - mark
```

4. Check the password use 

```
thor@jump_host ~/playbooks$ cat secrets/vault.txt 

P@ss3or432
```

5. Use the given secret vault by adding that in the `ansible.cfg` file,

```
thor@jump_host ~/playbooks$ vi ansible.cfg 
...
vault_password_file = /home/thor/playbooks/secrets/vault.txt

thor@jump_host ~/playbooks$ cat ansible.cfg 
[defaults]
host_key_checking = False
vault_password_file = /home/thor/playbooks/secrets/vault.txt
```

6. To check ansible inventory file run command on given app server and check the current users on the system,

```
thor@jump_host ~/playbooks$ ansible stapp03 -a "cat /etc/passwd" -i inventory
stapp02 | CHANGED | rc=0 >>
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
ansible:x:1000:1000::/home/ansible:/bin/bash
steve:x:1001:1001::/home/steve:/bin/bash
```

7. Create a playbook `add_users.yml` for ansible configuration,

```
thor@jump_host ~/playbook$ vi add_users.yml
```
*NOTE: Refer the current directory for config file*

8. Now, run an ansible playbook, 

```
thor@jump_host ~/playbook$ ansible-playbook playbook.yml -i inventory

thor@jump_host ~/playbooks$ ansible-playbook -i inventory add_users.yml

PLAY [ansible add users and groups playbook] *****************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
ok: [stapp02]

TASK [creating admin group] **********************************************************************************************************************************
changed: [stapp02]

TASK [creating developer group] ******************************************************************************************************************************
changed: [stapp02]

TASK [creating users for the admins group] *******************************************************************************************************************
changed: [stapp02] => (item=rob)
changed: [stapp02] => (item=david)
changed: [stapp02] => (item=joy)

TASK [creating users for the developers group] ***************************************************************************************************************
changed: [stapp02] => (item=tim)
changed: [stapp02] => (item=ray)
changed: [stapp02] => (item=jim)
changed: [stapp02] => (item=mark)

PLAY RECAP ***************************************************************************************************************************************************
stapp02                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

9. Now, we have created the users and group, once again check the all users on the app servers and you should see the newly created users and group by the above playbook.

```
ansible stapp03 -a "cat /etc/passwd" -i inventory

stapp02 | CHANGED | rc=0 >>
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
ansible:x:1000:1000::/home/ansible:/bin/bash
steve:x:1001:1001::/home/steve:/bin/bash
rob:x:1002:1004::/home/rob:/bin/bash
david:x:1003:1005::/home/david:/bin/bash
joy:x:1004:1006::/home/joy:/bin/bash
tim:x:1005:1003::/var/www/tim:/bin/bash
ray:x:1006:1003::/var/www/ray:/bin/bash
jim:x:1007:1003::/var/www/jim:/bin/bash
mark:x:1008:1003::/var/www/mark:/bin/bash
```

10. Verify further by SSH on the app server using newly created user,

```
thor@jump_host ~/playbooks$ ssh rob@stapp02
The authenticity of host 'stapp02 (172.16.238.11)' can't be established.
ECDSA key fingerprint is SHA256:ReSoP8PSQhGcHdJTvCEbbr3My3zZklFa1MlrPgit6B4.
ECDSA key fingerprint is MD5:77:9c:1b:75:fc:eb:96:e1:3f:1c:76:74:c0:86:c1:c7.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'stapp02' (ECDSA) to the list of known hosts.
rob@stapp02's password: 
[rob@stapp02 ~]$ id
uid=1002(rob) gid=1004(rob) groups=1004(rob),10(wheel),1002(admins)

[rob@stapp02 ~]$ sudo su
[root@stapp02 rob]# exit
```

Thank you.
