# ipmitool

## Commands


```
# Check power supply status
ipmitool sensors

# List ILO network
ipmitool lan print 1

# Set ILO network
ipmitool lan set 1 ipaddr 192.168.10.10
ipmitool lan set 1 netmask 255.255.255.0
ipmitool lan set 1 defgw ipaddr 192.168.10.11
```
