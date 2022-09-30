This is a quick example to demonstrate the difference between what happens after a setuid call in docker 20.10.17 and 20.10.18.

On docker 20.10.17, we can read a mode 604 file after we drop privs, but not on 20.10.18.

This is the output on docker 20.10.17 - we can see the contents of mysecret.txt before and after the setuid call with both mode 644 and 604:
```
[~/dropprivs]% bash run.sh 

<snip docker build> 

getuid: 0
getgid: 0
cat mysecret.txt
this is a secret
build's uid: 1000
build's gid: 1000
changing to new build user
new getuid: 1000
new getgid: 1000
cat mysecret.txt
this is a secret

<snip docker build> 

getuid: 0
getgid: 0
cat mysecret.txt
this is a secret
build's uid: 1000
build's gid: 1000
changing to new build user
new getuid: 1000
new getgid: 1000
cat mysecret.txt
this is a secret
```

This is the output on 20.10.18 docker - we can see the contents of mysecret.txt before the setuid call with both mode 644 and 604, but not after on a 604 file:
```
[~/dropprivs]% bash run.sh 

<snip docker build> 

getuid: 0
getgid: 0
cat mysecret.txt
this is a secret
build's uid: 1000
build's gid: 1000
changing to new build user
new getuid: 1000
new getgid: 1000
cat mysecret.txt
this is a secret

<snip docker build> 

getuid: 0
getgid: 0
cat mysecret.txt
this is a secret
build's uid: 1000
build's gid: 1000
changing to new build user
new getuid: 1000
new getgid: 1000
cat mysecret.txt
cat: mysecret.txt: Permission denied
```

