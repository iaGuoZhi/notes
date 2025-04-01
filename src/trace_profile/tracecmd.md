# tracecmd(1)

```
$ trace-cmd record -p function_graph -P <PID>
$ trace-cmd record -e sched:sched_switch <CMD>
$ trace-cmd record -p function_graph -l do_IRQ -e irq_handler_entry sleep 10
$ trace-cmd record -e kmalloc_node -f 'bytes_req > 1000'
$ trace-cmd report

# functions could be traced
$ trace-cmd list -f

# events could be traced
$ cat /sys/kernel/debug/tracing/available_events

# record events
#   * -e [ <event> | <subsystem> | <subsystem:even> | all  ]
$ trace-cmd record -e sched:sched_switch
```
