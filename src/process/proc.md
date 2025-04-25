# proc

> procfs is a virtual file system provided by the Linux kernel to applications. It contains a large amount of information for process and system management. Here, I introduce the procfs files I have worked with.

## procfs files

| Name           | Description |
|----------------|-------------|
| `cmdline`      | Kernel boot parameters. Can be modified in `/boot/grub/grub.cfg`. |
| `config.gz`    | The kernel config file, which needs to be decompressed before use. |
| `cpuinfo`      | Information about the current system’s CPUs. |
| `interrupts`   | Info about interrupts, such as user, CPU, and count. It's hard to read directly; consider using `python-linux-procfs` to parse `/proc/interrupts`. |
| `kallsyms`     | All symbols and addresses in the kernel. Requires root privileges to access addresses. |
| `loadavg`      | System load average over 1, 5, and 15 minutes. Load above 1 indicates high system usage. |
| `meminfo`      | Current memory information, including total, free, and page size breakdowns. |
| `sysrq-trigger`| Controls sysrq actions like dumping memory, rebooting, etc. It's triggered by magic sysrq keys or by writing to this file. |
| `uptime`       | System uptime. |
| `sys`          | Kernel parameter configuration directory. Files under `/proc/sys` are controlled by `sysctl`. Note: `/sys` is for driver management. |

## pid files

| Name         | Description |
|--------------|-------------|
| `attr`       | Only accessible with security module support (e.g., SELinux). |
| `cgroup`     | Shows the cgroup the current process belongs to. |
| `cmdline`    | Command line used to start the process. |
| `cwd`        | Symbolic link to the current working directory of the process. |
| `environ`    | All environment variables for the current process. |
| `exec`       | Symbolic link to the binary the process is executing. |
| `fd`         | A directory listing all file descriptors opened by the process. |
| `limits`     | Process limits, such as max number of open files. |
| `io`         | I/O stats including read/write bytes and network usage. Note: `eio` field may show strange values after process termination. |
| `maps`       | Memory map of the process's address space. |
| `oom_score`  | A value used by the OOM killer to prioritize which process to kill. The higher the score, the more likely it is to be killed. |
| `stat`       | Raw process metadata, including status, ownership, priority, last CPU used, CPU jiffies, etc. |
| `status`     | Human-readable version of `stat`. |
| `wchan`      | The function name in the kernel where the process is blocked. |

> Tools: You can use libraries like `psutil` or `python-linux-procfs` to parse and work with the procfs.

