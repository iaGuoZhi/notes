# traceroute

traceroute has been replaced by mtr.
Here is the output of `traceroute www.baidu.com`:

```
traceroute to www.baidu.com (153.3.238.28), 30 hops max, 60 byte packets
 1  _gateway (192.168.0.1)  0.455 ms  0.461 ms  0.481 ms
 2  192.168.1.1 (192.168.1.1)  1.855 ms  1.915 ms  1.953 ms
 3  223.166.74.1 (223.166.74.1)  4.345 ms  4.398 ms  4.743 ms
 4  * * *
 5  139.226.231.85 (139.226.231.85)  7.138 ms * *
 6  * * *
 7  153.3.228.70 (153.3.228.70)  8.003 ms  8.967 ms 153.3.228.138 (153.3.228.138)  9.487 ms
 8  153.37.96.250 (153.37.96.250)  12.548 ms 153.37.96.254 (153.37.96.254)  7.606 ms  7.736 ms
 9  * * *
10  * * *
11  * * *
12  * * *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

Here is the output of `mtr www.baidu.com`:

```
manjaro (192.168.0.106) -> www.baidu.com (153.3.238.28)                                                                                  2025-11-16T15:11:14+0800
Keys:  Help   Display mode   Restart statistics   Order of fields   quit
                                                                                                                         Packets               Pings
 Host                                                                                                                  Loss%   Snt   Last   Avg  Best  Wrst StDev
 1. _gateway                                                                                                            0.0%     8    0.2   0.3   0.2   0.3   0.0
 2. 192.168.1.1                                                                                                         0.0%     7    0.6   0.6   0.5   0.7   0.1
 3. 223.166.74.1                                                                                                        0.0%     7    2.6   2.4   2.0   2.8   0.3
 4. (waiting for reply)
 5. (waiting for reply)
 6. (waiting for reply)
 7. 153.3.228.126                                                                                                      57.1%     7    9.8   9.7   9.6   9.8   0.1
 8. 153.37.96.250                                                                                                       0.0%     7    9.0   9.0   8.9   9.1   0.1
 9. (waiting for reply)
10. (waiting for reply)
11. (waiting for reply)
12. 153.3.238.28                                                                                                        0.0%     7    9.3   8.6   8.2   9.3   0.4
```


## Why trace route has * * * in the output?

When you run the `traceroute` command to trace the path packets take to reach a destination, you may encounter lines in the output that contain `* * *`. This indicates that the traceroute tool did not receive a response from one or more of the intermediate routers (hops) along the path to the destination.
