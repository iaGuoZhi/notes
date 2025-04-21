# Grub

## Basic Commands

| Command            | Description                          |
|--------------------|--------------------------------------|
| `help`             | List all available commands         |
| `help <command>`   | Show help for a specific command    |
| `ls`               | List all disks and partitions       |
| `ls (hdX,Y)`       | Inspect filesystem on partition     |
| `set`              | View/set environment variables      |
| `insmod`           | Load module (e.g., ext2, ntfs)      |
| `reboot`           | Reboot the system                   |

## Device & Filesystem

| Command                     | Description                          |
|-----------------------------|--------------------------------------|
| `ls -l`                     | Detailed device listing             |
| `cat (hdX,Y)/path/file`     | View file contents                  |
| `loopback`                  | Mount ISO image files               |

## Boot Commands

| Command                          | Description                          |
|-----------------------------------|--------------------------------------|
| `linux`/`linux16`/`linuxefi`     | Load Linux kernel                   |
| `initrd`                         | Load initramfs image                |
| `chainloader`                    | Chainload another bootloader        |
| `boot`                           | Boot the loaded system              |

## Environment Variables

| Variable       | Purpose                  | Example                     |
|----------------|--------------------------|-----------------------------|
| `root`        | Set root partition       | `set root=(hd0,gpt2)`       |
| `prefix`      | Set GRUB directory path  | `set prefix=(hd0,gpt1)/boot/grub` |
| `default`     | Default boot entry       | `set default=0`             |
| `timeout`     | Timeout in seconds       | `set timeout=5`             |

## Practical Examples

```grub
# Typical Linux boot sequence
set root=(hd0,gpt2)
linux /vmlinuz root=/dev/sda2 ro
initrd /initramfs.img
boot

# Boot from ISO file
loopback loop /path/to/image.iso
linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=/image.iso
initrd (loop)/casper/initrd
boot
```
