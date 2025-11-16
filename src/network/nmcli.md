# nmcli

```
nmcli con reload
nmcli dev reapply <device_name>
nmcli con down <connection_name>
nmcli con up <connection_name> # More powerful than `nmcli con reload` and `nmcli dev reapply`
nmcli con route add <destination> <gateway>
nmcli con ip4 set <connection_name> <ip_address>/<prefix_length>
```
