1. ssh into the storage server 

`ssh natasha@ststor01`

2. Check to see all branches in the directory

```
cd /usr/src/kodekloudrepos/news

git branch -a
```

output: 
```
[root@ststor01 news]# git branch -a
  master
* xfusioncorp_news
  remotes/origin/master
```

3. checkout to the `master` branch before you delete the `xfusion_news` branch 

```
git checkout master
```

[root@ststor01 news]# git checkout master
Switched to branch 'master'


4. Delete `xfusion_news` branch 

```
git branch -d xfusioncorp_news

```

[root@ststor01 news]# git branch -d xfusioncorp_news
Deleted branch xfusioncorp_news (was 24acd4e).
[root@ststor01 news]# git branch -a 
* master
  remotes/origin/master


Thank You!!