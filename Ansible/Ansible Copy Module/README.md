#### Ansible Copy Module

There is data on jump host that needs to be copied on all application servers in Stratos DC. Nautilus DevOps team want to perform this task using Ansible only. Perform this task using Ansible as per details mentioned below:

a. On jump host create an inventory file `/home/thor/ansible/inventory` and add all application servers as managed nodes.

b. On jump host create a playbook `/home/thor/ansible/playbook.yml` to copy `/usr/src/dba/index.html` file to all application servers at location `/opt/dba`.

Note: Validation will try to run playbook using command `ansible-playbook -i inventory playbook.yml` so please make sure playbook works this way, without passing any extra arguments.

