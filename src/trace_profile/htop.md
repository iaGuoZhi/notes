# htop

Press F1 to view all available shortcuts.

By default, htop does not show kernel threads; you need to enable this option manually.

Without sudo, htop cannot display I/O statistics for processes owned by other users.

htop supports filtering processes via the F3 (Search) and F4 (Filter) keys.

Use htop -t or press F5 followed by t to switch to a tree view (similar to pstree).

You can sort by P (CPU usage), M (memory usage), or T (process time), just like in top.

After selecting a process, press l (lowercase L) to view the list of files it has opened.

htop cannot show all processes running on a specific CPU — use ps -o psr for that purpose.

htop allows viewing and modifying CPU affinity, but it does not support filtering processes by their affinity.
