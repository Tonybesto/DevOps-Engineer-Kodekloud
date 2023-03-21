#### Git Clone Repositories

The task is to clone from a local repository. So, go the the directory where we want to clone the git repository named `kodekloudrepos`,

    cd /usr/src/kodekloudrepos 

Then clone from the local repository using the below,

    [natasha@ststor01 kodekloudrepos]$ sudo git clone /opt/apps.git

Once this is completed, verify that the repo is cloned correctly, 

    [natasha@ststor01 kodekloudrepos]$ ls -ltr
    total 4
    drwxr-xr-x 3 root root 4096 Jul 11 14:58 apps
    [natasha@ststor01 kodekloudrepos]$ cd apps/
    [natasha@ststor01 apps]$ ls -ltar
    total 12
    drwxr-xr-x 3 root root 4096 Jul 11 14:58 ..
    drwxr-xr-x 3 root root 4096 Jul 11 14:58 .
    drwxr-xr-x 7 root root 4096 Jul 11 14:58 .git

Thank you.
