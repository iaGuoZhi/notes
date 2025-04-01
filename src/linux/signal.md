# signal

## signal numbers

| Signal | Value | Action | Comment |
|--------|-------|--------|---------|
| SIGHUP | 1     | Term   | Hangup detected on controlling terminal or death of controlling process |
| SIGINT | 2     | Term   | Interrupt from keyboard |
| SIGKILL| 9     | Term   | Kill signal |
| SIGTERM| 15    | Term   | Termination signal |
| SIGSTOP| 17,19 | Stop   | Stop the process |
| SIGCONT| 18,25 | Cont   | Continue the process if stopped |

## signal handling

trap command can be used to catch signals and run a command when a signal is received.

```bash
trap 'echo "Caught signal"' SIGINT
```
