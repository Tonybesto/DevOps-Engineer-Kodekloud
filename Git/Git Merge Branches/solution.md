#### Git Merge Branches

1. SSH to storage server and change directory to `news`,

```
[root@ststor01 natasha]# cd /usr/src/kodekloudrepos/news/
```

2. Check the `git status`,

```
[root@ststor01 news]# git status
# On branch master
nothing to commit, working directory clean
```

3. Create a new branch named `xfusion` and check git status,

```
[root@ststor01 news]# git checkout -b xfusion
Switched to a new branch 'xfusion'


[root@ststor01 news]# git status
# On branch devops
nothing to commit, working directory clean
```

4. Copy `index.html` from tmp to current directory,

```
[root@ststor01 news]# cp /tmp/index.html .
```

5. Add index.html file in git staging area and check git status,

```
[root@ststor01 news]# git add index.html

[root@ststor01 news]# git status
# On branch devops
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)#
#       new file:   index.html
#
```

6. Do the git commit for the added file,

```
[root@ststor01 beta]# git commit -m "index.html file added"
[nautilus 716859c] index.html file added
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
```

7. Now, while while `git push` you might face issue along with warning set config, set them as below,
 
```
git config --global push.default matching
git config --global push.default simple
```

8. Now, push to origin remote branch of devops,

```
[[root@ststor01 apps]# git push --set-upstream origin xfusion
Counting objects: 4, done.
Delta compression using up to 36 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 334 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /opt/news.git
 * [new branch]      xfusion -> xfusion
Branch xfusion set up to track remote branch xfusion from origin.
```

9. Checkout to `master` branch again,

```
[root@ststor01 apps]# git checkout master
Switched to branch 'master'
```

10. Now, go merge a branch `xfusion` to master

```
[root@ststor01 apps]# git merge xfusion
Updating 0ec0744..a7be293
Fast-forward
 index.html | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
```

11. Finally, push the changes to origin master branch.

```
[root@ststor01 apps]# git push origin master
Total 0 (delta 0), reused 0 (delta 0)
To /opt/news.git
   0ec0744..a7be293  master -> master
```

Thank you.
