# mount

```
mount ramfs -t ramfs -o size=1G,mode=0755 /mnt/ramfs # mount a ramfs filesystem
mount hugetlbfs -t hugetlbfs -o pagesize=2M /mnt/hugepages # mount a hugetlbfs filesystem
mount -t nfs 192.168.0.100:/mnt/nfs /mnt/nfs # mount a nfs filesystem
```
