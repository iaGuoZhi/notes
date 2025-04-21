# rescue

## Entering the Rescue

Add below kernel parameters in edit mode of GRUB:

```bash
init=/bin/bash
or
systemd.unit=rescue.target
```

## Basic Commands

### Module management

```bash
insmod part_gpt     # for GPT disks
insmod efi_gop      # UEFI graphics
insmod chain        # Windows boot
```
### File system repair

```bash
fsck -y /dev/sda1
mount -o remount,rw /
```

### Grub reinstall

```bash
chroot /mnt # use Live CD
grub-install /dev/sda
update-grub
```

or

```bash
mount /dev/nvme0n1p1 /mnt
mount /dev/nvme0n1p2 /mnt/boot
grub-install --target=x86_64-efi --efi-directory=/mnt/boot --bootloader-id=GRUB
grub-mkconfig -o /mnt/boot/grub/grub.cfg
```

### Network configuration

```bash
ip link set eth0 up
ip addr add 192.168.1.100/24 dev eth0
ip route add default via 192.168.1.1
```
