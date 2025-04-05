# UEFI commands

## 1. System Information Commands

| Command | Description | Syntax | Example |
|---------|-------------|--------|---------|
| `map` | List all storage devices | `map [-r]` | `map -r` *(refresh list)* |
| `memmap` | Display memory map | `memmap` | `memmap > meminfo.txt` |
| `smbiosview` | View SMBIOS tables | `smbiosview [-t TYPE]` | `smbiosview -t 1` *(BIOS info)* |
| `dmpstore` | Manage UEFI variables | `dmpstore [-all]` | `dmpstore -all` |
| `version` | Show firmware version | `version` | `version` |

## 2. Memory Operations

| Command | Description | Syntax | Example |
|---------|-------------|--------|---------|
| `mm` | Modify memory (hex editor) | `mm <addr> [width]` | `mm 0x80000000 4` *(edit dword)* |
| `mem` | Display memory | `mem <addr> <length>` | `mem 0x80000000 10` |
| `dmem` | Formatted memory dump | `dmem <addr> <length>` | `dmem 0xFFF00000 20` |

**Memory Width Specifiers**:
- `1` = byte
- `2` = word (2 bytes)
- `4` = dword (4 bytes)
- `8` = qword (8 bytes)

## 3. File System Commands

| Command | Description | Syntax | Example |
|---------|-------------|--------|---------|
| `ls` | List files | `ls [path]` | `ls fs0:\EFI` |
| `cd` | Change directory | `cd <path>` | `cd fs1:\` |
| `edit` | Text editor | `edit <file>` | `edit startup.nsh` |
| `hexedit` | Hex editor | `hexedit <file>` | `hexedit config.bin` |
| `cp` | Copy file | `cp <src> <dest>` | `cp kernel.efi fs0:\` |
| `rm` | Delete file | `rm <file>` | `rm old.efi` |
| `mkdir` | Create directory | `mkdir <path>` | `mkdir \Backup` |

## 4. Boot Management

| Command | Description | Syntax | Example |
|---------|-------------|--------|---------|
| `bcfg` | Manage boot entries | `bcfg boot [options]` | `bcfg boot dump` |
| `boot` | Execute EFI binary | `boot <file>` | `boot \EFI\BOOT\bootx64.efi` |
| `exit` | Exit shell | `exit` | `exit` |

**Common bcfg operations**:
```bash
bcfg boot add 0 fs0:\EFI\grub\grubx64.efi "Linux"  # Add entry
bcfg boot mv 3 0                                   # Reorder entries
bcfg boot rm 2                                     # Remove entry```

## 5. Network Commands
| Command | Description | Syntax | Example |
|---------|-------------|--------|---------|
|ifconfig | Configure network interfaces | `ifconfig <interface> [options]` | `ifconfig -a` |
|ping     |Network test |   ping <IP>  |  ping 192.168.1.1
|dhcp     |Get IP address  |dhcp [-r] <iface>   | dhcp -r eth0
|tftp     |File transfer   |tftp [-g] <IP> <file> |  tftp -g 10.0.0.1 kernel.efi

## 6. Miscellaneous Commands
| Command | Description | Syntax | Example |
|---------|-------------|--------|---------|
|reset | Reset system | `reset` | `reset` |
|startup.nsh | Execute script | `startup.nsh` | `startup.nsh` |
|timer | Measure time | time [HH:MM:SS] | time 14:30:00 |

