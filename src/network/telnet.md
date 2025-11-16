# telnet

## Usage

```
telnet ip port
```

## Response


1. Connected to example.com. 
2. telnet: Unable to connect to remote host: Connection refused.
    1. Possible reasons:
        1. The server is not running a service on the specified port.
        2. A firewall is blocking the connection.
        3. Current IP is blocked by the server.
        4. Current IP is duplicated with another device on the network.
3. telnet: Unable to connect to remote host: Connection timed out
