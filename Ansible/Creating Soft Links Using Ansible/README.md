#### Creating Soft Links Using Ansible

The Nautilus DevOps team is practicing some of the Ansible modules and creating and testing different Ansible playbooks to accomplish tasks. Recently they started testing an Ansible file module to create soft links on all app servers. Below you can find more details about it.

Create a `playbook.yml` under `/home/thor/ansible` on `jump host`; an `inventory` file is already present under `/home/thor/ansible` directory on `jump host` itself.

Create an empty file `/opt/data/blog.txt` on app server 1; its user owner and group owner should be `tony`. Create a `symbolic link` of source path `/opt/data` to destination `/var/www/html`.

Create an empty file `/opt/data/story.txt` on app server 2; its user owner and group owner should be steve. Create a `symbolic link` of source path `/opt/data` to destination `/var/www/html`.

Create an empty file `/opt/data/media.txt `on app server 3; its user owner and group owner should be `banner`. Create a symbolic link of source path `/opt/data` to destination `/var/www/html`.

`Note`: Validation will try to run playbook using command `ansible-playbook -i inventory playbook.yml` so please make sure playbook works this way, without passing any extra arguments.
