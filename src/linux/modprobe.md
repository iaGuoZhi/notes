# modprobe

modprobe is used to install and remove kernel modules(.ko).

The basic usage is below, make sure the ko files are under /lib/modules/$(uname -r)/extra or /lib/modules/$(uname -r)/updates.

```
modprobe module
modprobe -r module
```
