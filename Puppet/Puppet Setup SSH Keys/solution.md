#### Puppet Setup SSH Keys

1. Change directory to `manifest` on puppet master node(jump_host),

```
root@jump_host /home/thor# cd /etc/puppetlabs/code/environments/production/manifests
```

2. Check that SSH public key is present on puppet master node, we will be adding this key to `authorized_keys` on all app servers, respectively..

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1B4pvUpjeE3nfgSBgSgWPF18P9nucZeV/nMkvK/cP1rnrlIE/jgySDjr2Z1h9d8xEKlmhq8BuLuSo3Ytslv416fjh0riK9mAARtKoN0ERUsKhezDeK7CIygPxYG/thu1XX2zITbfIBV+CYSjOfELk2cYd3r5kY9kQL5JkDPyPDwxT6xKlvz5JXEFpw8bwPN2DMeP0tEP2WodJGyVOGPq2VXL/UJDveSQKDWJc5ecPfryeJxPwce9iJJRr3/ScBgQKCcSxh4OAKUlGnoV2ligZ7F+DC/02VTRYt1o3jRPdSbZ+6FvVKZdfEqEFfA5tsOausG7jjr2O3yBBWVmWSerL thor@jump_host.stratos.xfusioncorp.com
```

3. Now, create puppet programming file, `official.pp` with resource  `ssh_authorized_key` to copy ssh key,

```
root@jump_host vi official.pp
```
*Note: Refer same directory for its configuration*

3. Now, validate the pp file using parser,

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# puppet parser validate official.pp
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

4. On all all servers, run a test,

```
[root@stapp01 ~]# puppet agent -tv
Info: Using configured environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Retrieving locales
Info: Caching catalog for stapp01.stratos.xfusioncorp.com
Info: Applying configuration version '1678625690'
Notice: /Stage[main]/Ssh_node1/Ssh_authorized_key[root@jump_host]/key: key changed 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqMWxj1XwglDg2ug1O7OB78lsmA91mi7URN5BbV3x4RYR/iEr0rdw32/Jx4iFwevyyXeoIQfbmzMgRFDeav8S4Nby/LPHpYC8bBWJ3kNKU+ROONgMp6d5xjswNLz52TEeNY/FBSTiJJjjHAaFDLxerc8ROpWeNAOH2BaySqtZu502hGKcb+1YLvAuoElsWf8Z5g3qTjcGCvWfmU2r1dN+iRPB0yxU1sws0dBFONGZHJPs+HfQzdBG11XoSOEUcgnqqd1wEx9y0n+NuPo9oD3W6kyUu6rN5b9SHHE+eOkdYpqLDxlNX9rR6mf7AzguSToZS4XzJPCf7eJrpzRiplyXH' to 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1B4pvUpjeE3nfgSBgSgWPF18P9nucZeV/nMkvK/cP1rnrlIE/jgySDjr2Z1h9d8xEKlmhq8BuLuSo3Ytslv416fjh0riK9mAARtKoN0ERUsKhezDeK7CIygPxYG/thu1XX2zITbfIBV+CYSjOfELk2cYd3r5kY9kQL5JkDPyPDwxT6xKlvz5JXEFpw8bwPN2DMeP0tEP2WodJGyVOGPq2VXL/UJDveSQKDWJc5ecPfryeJxPwce9iJJRr3/ScBgQKCcSxh4OAKUlGnoV2ligZ7F+DC/02VTRYt1o3jRPdSbZ+6FvVKZdfEqEFfA5tsOausG7jjr2O3yBBWVmWSerL'
Info: Computing checksum on file /home/tony/.ssh/authorized_keys
Notice: Applied catalog in 0.08 seconds
```

5. Finally, validate the contents of `authorized_keys` on all app servers or you can do try to ssh as shown below, which should not show enter a password prompt,

```
root@jump_host /etc/puppetlabs/code/environments/production/manifests# ssh tony@172.16.238.10
Last login: Sun Sep 20 12:52:53 2020 from jump_host.stratos.xfusioncorp.com
[tony@stapp01 ~]$ exit
logout
Connection to 172.16.238.10 closed.
root@jump_host /etc/puppetlabs/code/environments/production/manifests# ssh steve@172.16.238.11
Last login: Sun Sep 20 12:53:14 2020 from jump_host.stratos.xfusioncorp.com[steve@stapp02 ~]$ exit
logout
Connection to 172.16.238.11 closed.
root@jump_host /etc/puppetlabs/code/environments/production/manifests# ssh banner@172.16.238.12
Last login: Sun Sep 20 12:53:30 2020 from jump_host.stratos.xfusioncorp.com
[banner@stapp03 ~]$ exit
logout
Connection to 172.16.238.12 closed.
root@jump_host /etc/puppetlabs/code/environments/production/manifests#
```

Thank you.
