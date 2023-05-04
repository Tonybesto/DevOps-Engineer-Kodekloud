####  Ansible Ping Module Usage

First, create an ssh public-private key on ansible server(jump_host)

    ssh-keygen

Then, copy ssh pulic key you created in the above step to the reomte host i.e. app server two,

    ssh-copy-id -i ~/.ssh/id_rsa.pub steve@172.16.238.11

Check the inventory file and group namep[strapp] for the hosts mentioned in there,

cat /home/thor/ansible/inventory
```
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```
thor@jump_host ~/ansible$ ssh-keygen -t rsa -b 2048
```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa.
Your public key has been saved in /home/thor/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:MsvZ74U80k0X32foopdH8GjSqKg4DLN6aC9MYgGGVaI thor@jump_host.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 2048]----+
|..o..            |
|oo .             |
|E             .  |
| .          .  +.|
|  .   o S  o.+o =|
|+o   . * oo++oo..|
|=*    +.o.=o+o.  |
|o++.  . .o +o..  |
|+.+o..   .+. .   |
+----[SHA256]-----+
```

thor@jump_host ~/ansible$ ssh-copy-id tony@stapp01
```
/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.
```


thor@jump_host ~/ansible$ ansible stapp01 -m ping -i inventory -v
```
Using /etc/ansible/ansible.cfg as config file
stapp01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
```

**NOTE: I am getting success for all 3 server as I copied ssh public key to all 3 app servers**

Hope it helps. Thanks.
