# Solarflare Onload Command Reference

## 1. Core Management Commands
| Command | Description | Example |
|---------|-------------|---------|
| `onload` | Main control utility | `onload --status` |
| `onload_tool` | Advanced debugging | `onload_tool dump` |
| `onload_stackdump` | Capture stack traces | `onload_stackdump -a` |

## 2. Interface Configuration
| Command | Description | Example |
|---------|-------------|---------|
| `sfcaffinity` | Set CPU affinity | `sfcaffinity -a eth3 -c 2-4` |
| `sfcstat` | Interface statistics | `sfcstat -i eth2 -p rx` |
| `sfctool` | Low-level control | `sfctool getregs` |

## 3. Performance Optimization
| Command | Description | Example |
|---------|-------------|---------|
| `onload_profile` | Application profiling | `onload_profile -p webserver` |
| `onload_fastpath` | Toggle fastpath | `onload_fastpath enable` |
| `ef_vi_stats` | Virtual interface stats | `ef_vi_stats -i eth1` |

## 4. Debugging Tools
| Command | Description | Example |
|---------|-------------|---------|
| `onload_debug` | Kernel debug levels | `onload_debug -v 5` |
| `ef_dump_vis` | Inspect VIs | `ef_dump_vis -i eth1 -f` |
| `onload_kstackdump` | Kernel stack dump | `onload_kstackdump -p 1234` |

## 5. Installation & Maintenance
| Command | Description | Example |
|---------|-------------|---------|
| `onload_install` | Install/upgrade | `onload_install --force` |
| `onload_uninstall` | Remove driver | `onload_uninstall --purge` |
| `onload_verify` | System check | `onload_verify --net` |

## 6. Log Management
| Command | Description | Example |
|---------|-------------|---------|
| `onload_logdump` | Export logs | `onload_logdump -e errors.log` |
| `sfcresetlog` | Reset counters | `sfcresetlog -a` |

