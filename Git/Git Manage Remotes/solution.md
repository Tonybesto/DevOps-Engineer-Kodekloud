#### Git Manage Remotes

SSH to Storage server and change directory to `/usr/src/kodekloudrepos/cluster` using the follwong command,

```
cd /usr/src/kodekloudrepos/cluster
```

Now as mentioned into sub-task 1, add an remote named dev_cluster and point it to `/opt/xfusioncorp_cluster.git` using a command,

```
git remote add dev_cluster /opt/xfusioncorp_cluster.git
```

Validate that a remote has been added successfully using remote command, 

[root@ststor01 cluster]# git remote -v
dev_cluster     /opt/xfusioncorp_cluster.git (fetch)
dev_cluster     /opt/xfusioncorp_cluster.git (push)
origin  /opt/cluster.git (fetch)
origin  /opt/cluster.git (push)


Copy the `index.html` file as mentioned into sub-task 2,

[root@ststor01 apps]# cp /tmp/index.html .

Add it to git and commit respectively,

[root@ststor01 apps]# git add index.html
[root@ststor01 apps]# git commit -m "added index.html"

As mentioned in sub-task 3, push this change to new remote that we have added in the above named `dev_cluster`, 

[root@ststor01 cluster]# git push dev_cluster master
```
Counting objects: 6, done.
Delta compression using up to 36 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 583 bytes | 0 bytes/s, done.
Total 6 (delta 0), reused 0 (delta 0)
To /opt/xfusioncorp_cluster.git
 * [new branch]      master -> master
```
Thank you.



