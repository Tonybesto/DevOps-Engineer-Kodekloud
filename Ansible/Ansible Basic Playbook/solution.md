#### Ansible Basic Playbook

1. On Jump host change a directory to `Ansible`,

```
cd /home/thor/ansible/
```

2. Now check the content of the inventory file,

```
thor@jump_host ~/ansible$ cat inventory
stapp02 ansible_host=172.16.238.11 ansible_user=steve
```

Change the invetory_hostname, IP and ansible_user to make it run on App server 2, after changing it will be as below,

```
thor@jump_host ~/ansible$ cat inventory
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
```

3. Now create a `playbook.yml` and write an ansible script into it. Refer the same file in the current directory.

4. Finally execute the ansible script,

```
thor@jump_host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [Deploy playbook] *************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [stapp02]

TASK [create an empty file on app server2] *****************************************************************************************
changed: [stapp02]

PLAY RECAP *************************************************************************************************************************
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
5. Verify that the file got created on the App server 3 and list the content of /tmp directory. You can see the file in there.

Thank you!!.
