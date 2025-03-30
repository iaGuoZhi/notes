# find(1)

```
find <start> [opts]
    -maxdepth <n>        maximally search n dirs deep
    -type <t>            match on file type
                           f    regular file
                           d    directory
    -user <name>         list files owned by username
    -name <glob>         list files matching glob (only filename)
    -iname <glob>        list files matching glob case-insensitive

    -exec <cmd> {} ;     run cmd on each file
    -exec <cmd> {} +     run cmd with all files as argument
```
> Depending on the shell the `<glob>` must be quoted or escaped. The
> exec modifier characters `;` and `+` also may need to be escaped.

### Example `-exec` option
```sh
> find . -maxdepth 1 -type d -exec echo x {} \;
# x .
# x ./.github
# x ./book
# x ./src
# x ./.git
# x ./docs

> find . -maxdepth 1 -type d -exec echo x {} +
# x . ./.github ./book ./src ./.git ./docs

> find . -type f -not -name '*005*' -exec rm {} \;
# remove all files not containing '005' in filename

> find . -type f -exec ls -s {} \; | sort -n -r | head -1
# list file with largest size

> find ./ -maxdepth 2 -type f | wc -l
# count files in current and subdirectories

> find . -type f -name 'foo' -exec rename 's/foo/bar/g' {} \;
# rename all files named 'foo' to 'bar'

> find . -type f -mtime -1
# list files modified in the last 24 hours
```
