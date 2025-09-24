# ftrace

```
cd /sys/kernel/debug/tracing
echo 1 > events/tlb/enable
echo 1 > events/sched/enable
echo 1 > tracing_on
cat trace_pipe > /tmp/trace.log
```
