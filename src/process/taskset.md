# taskset(1)

Set cpu affinity for new processes or already running ones.

```sh
# Pin all (-a) tasks of new command on cores 0,1,2,4.
taskset -ac 0-2,4 CMD [ARGS]

# Pin all tasks of running PID onto cores 0,2,4.
taskset -ac 0-5:2 -p PID
```
