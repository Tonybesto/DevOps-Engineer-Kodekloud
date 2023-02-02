ssh max@ststor01
```
The authenticity of host 'ststor01 (172.16.238.15)' can't be established.
ECDSA key fingerprint is SHA256:0z85j/k+4Nf8WKbHJzxo1AOv4FeRA8LPET2N3BEkYyo.
ECDSA key fingerprint is MD5:74:e6:4d:c4:b3:80:07:be:03:30:0a:bf:1e:eb:e6:82.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ststor01,172.16.238.15' (ECDSA) to the list of known hosts.
```
max@ststor01's password: 
```
Welcome to xFusionCorp Storage server.
```
max $ pwd
```
/home/max
```
max $ git clone http://git.stratos.xfusioncorp.com/max/story_media.git
```
Cloning into 'story_media'...
warning: You appear to have cloned an empty repository.
Checking connectivity... done.
```

cd story_media/

cp /usr/data/*.* .
ls
git status




max $  git add .

max $ git commit -m "add stories"
```
[master (root-commit) 743eb26] add stories
 Committer: Linux User <max@ststor01.stratos.xfusioncorp.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 2 files changed, 42 insertions(+)
 create mode 100644 frogs-and-ox.txt
 create mode 100644 lion-and-mouse.txt
```
max (master)$ git push
```
Username for 'http://git.stratos.xfusioncorp.com': max
Password for 'http://max@git.stratos.xfusioncorp.com': 
Counting objects: 4, done.
Delta compression using up to 56 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 1.19 KiB | 0 bytes/s, done.
Total 4 (delta 0), reused 0 (delta 0)
remote: . Processing 1 references
remote: Processed 1 references in total
To http://git.stratos.xfusioncorp.com/max/story_media.git
 * [new branch]      master -> master
```

max (master)$ git checkout -b max_games
```
Switched to a new branch 'max_games'
```

max (max_games)$ cp /tmp/stories/story-index-max.txt .

max (max_games)$ ls
```
frogs-and-ox.txt     lion-and-mouse.txt   story-index-max.txt
```


max (max_games)$ vi story-index-max.txt

```
change the Mooose to Mouse
```
max (max_games)$ git status

```
On branch max_games
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        story-index-max.txt

nothing added to commit but untracked files present (use "git add" to track)
```
max (max_games)$ git add .

max (max_games)$ git commit -m "typo fixed for Mooose"
```
[max_games 5bac148] typo fixed for Mooose
 Committer: Linux User <max@ststor01.stratos.xfusioncorp.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 insertions(+)
 create mode 100644 story-index-max.txt
```
max (max_games)$ git push -u origin master
```
Username for 'http://git.stratos.xfusioncorp.com': max
Password for 'http://max@git.stratos.xfusioncorp.com': 
Branch master set up to track remote branch master from origin.
Everything up-to-
```
max (max_games)$ git push -u origin max_games
```
Username for 'http://git.stratos.xfusioncorp.com': max
Password for 'http://max@git.stratos.xfusioncorp.com': 
Counting objects: 3, done.
Delta compression using up to 56 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 413 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
remote: 
remote: Create a new pull request for 'max_games':
remote:   http://git.stratos.xfusioncorp.com/max/story_media/compare/master...max_games
remote: 
remote: . Processing 1 references
remote: Processed 1 references in total
To http://git.stratos.xfusioncorp.com/max/story_media.git
 * [new branch]      max_games -> max_games
Branch max_games set up to track remote branch max_games from origin.
```