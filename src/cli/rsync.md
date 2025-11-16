# rsync

There is a difference between using a trailing slash `/` at the end of the source path in `rsync` command and not using it.
No difference for the slah '/' at the end of the destination path.
```
rsync -avz ./source/ user@remote:/destination/ # Copy all the files under ./source/ to /destination/ on remote server, there is no ./source/ directory created on remote
rsync -avz ./source user@remote:/destination/ # Copy the entire ./source directory to /destination/ on remote server, creating ./source/ directory on remote
rsync -avz ./source/ user@remote:/destination/source/ # Copy all the files under ./source/ to /destination/source/ on remote server, creating /source/ directory on remote
rsync -avz ./source user@remote:/destination/source/ # Copy the entire ./source directory to /destination/source on remote server, creating ./source/source directory on remote
```
