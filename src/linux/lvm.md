# lvm


```
pvcreate /dev/sda1
vgcreate app /dev/sda1
lvcreate -l 100%FREE -n app app
mkfs.xfs /dev/app/app -L APP
mount /dev/app/app /app
```
