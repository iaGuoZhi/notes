# bash(1)

## Keys

```bash
ctrl + r   # search history
alt/esc + .    # last argument of previous command
ctrl + l   # clear screen
ctrl + a   # move to beginning of line
ctrl + e   # move to end of line
ctrl + w   # delete word before cursor
ctrl + u   # delete from cursor to beginning of line
ctrl + k   # delete from cursor to end of line
ctrl + y   # paste deleted text
```
## Paratheses

```bash
()         # run in subshell
(())        # arithmetic expansion
[]          # test command, check file attributes, numeric comparison
[[]]        # extended test command, more powerful than [], string comparison
```

## Expansion

### Generator

```bash
# generate two names
cp file{,.bak}
# generate sequence from n to m
{n..m}
# generate sequence from n to m step by s
{n..m..s}

# expand cartesian product
{a,b}{c,d}
```

### !, ^ and -

```bash
!!          # last command
!$          # last argument of last command
!*          # all arguments of last command
^foo^bar    # replace first occurence of foo with bar in last command
cd -       # change to previous working directory
```

### $

```bash
$?          # exit status of last command
$$          # PID of current shell
$!          # PID of last background command
$#          # number of arguments
$@          # all arguments
$*          # all arguments as single string
```

### Parameter
```bash
# default value
bar=${foo:-some_val}  # if $foo set, then bar=$foo else bar=some_val

# check param set
bar=${foo:?msg}  # if $foo set, then bar=$foo else exit and print msg

# indirect
FOO=foo
BAR=FOO
bar=${!BAR}  # deref value of BAR -> bar=$FOO

# prefix
${foo#prefix}  # remove prefix when expanding $foo
# suffix
${foo%suffix}  # remove suffix when expanding $foo

# substitute
${foo/pattern/string}  # replace pattern with string when expanding foo
# pattern starts with
# '/'   replace all occurences of pattern
# '#'   pattern match at beginning
# '%'   pattern match at end

# set programmatically with printf builtin
printf -v "VAR1" "abc"
NAME=VAR2
printf -v "$NAME" "%s" "def"
```

> Note: `prefix`/`suffix`/`pattern` are expanded as [pathnames](#pathname).

### Pathname

```bash
*           match any string
?           match any single char
\\          match backslash
[abc]       match any char of 'a' 'b' 'c'
[a-z]       match any char between 'a' - 'z'
[^ab]       negate, match all not 'a' 'b'
[:class:]   match any char in class, available:
              alnum,alpha,ascii,blank,cntrl,digit,graph,lower,
              print,punct,space,upper,word,xdigit
```

With `extglob` shell option enabled it is possible to have more powerful
patterns. In the following `pattern-list` is one ore more patterns separated
by `|` char.

```bash
?(pattern-list)   matches zero or one occurrence of the given patterns
*(pattern-list)   matches zero or more occurrences of the given patterns
+(pattern-list)   matches one or more occurrences of the given patterns
@(pattern-list)   matches one of the given patterns
!(pattern-list)   matches anything except one of the given patterns
```
> Note: `shopt -s extglob`/`shopt -u extglob` to enable/disable `extglob`
> option.

## I/O redirection

> Note: The trick with bash I/O redirection is to interpret from left-to-right.

```bash
# stdout & stderr to file
command >file 2>&1
# equivalent
command &>file

# stderr to stdout & stdout to file
command 2>&1 >file
```
> The article [Bash One-Liners Explained, Part III: All about
> redirections](https://catonmat.net/bash-one-liners-explained-part-three)
> contains some nice visualization to explain bash redirections.

### Explanation

```bash
j>&i
```
Duplicate `fd i` to `fd j`, making `j` a copy of `i`. See [dup2(2)][dup2].

Example:
```bash
command 2>&1 >file
```
1. duplicate `fd 1` to `fd 2`, effectively redirecting `stderr` to `stdout`
2. redirect `stdout` to `file`

## Process substitution ([ref][psub])

Process substitution allows to redirect the stdout of multiple processes at
once.
```bash
vim -d <(grep foo bar) <(grep foo moose)
```

## Command grouping

Execute commands in a group with or without subshell. Can be used to easily
redirect stdout/stderr of all commands in the group into one file.
```bash
# Group commands without subshell.
v=abc ; { v=foo; echo $v; } ; echo $v
# foo
# foo

# Group commands with subshell.
v=abc ; ( v=foo; echo $v; ) ; echo $v
# foo
# abc
```

## Trap Handling

```bash
trap "<CMDs>" <SIG>/EXIT

# Show current trap handler.
trap -p
# List signal names.
trap -l
```

#### Example: Run handler only on error exit
```bash
trap 'test $? -ne 0 && echo "run exit trap"' EXIT

# -> no print
exit 0
# -> print
exit 1
```

#### Example: Mutex in shell script
For example if a script is triggered in unsynchronized, we may want to ensure
that a single script instance runs.
```bash
# open file=LOCK with fd=100
exec 100>LOCK
# take exclusive lock, wait maximal for 3600s
flock -w 3600 -x 100 || { echo "flock timeout"; exit 1; }

# eg automatically release lock when script exits
trap "flock -u 100" EXIT
```

## Argument parsing with `getopts`

The `getopts` builtin uses following global variables:
- `OPTARG`, value of last option argument
- `OPTIND`, index of the next argument to process (user must reset)
- `OPTERR`, display errors if set to `1`

```bash
getopts <optstring> <param> [<args>]
```
- `<optstring>` specifies the names of supported options, eg `f:c`
  - `f:` means `-f` option with an argument
  - `c` means `-c` option without an argument
- `<param>` specifies a variable name which `getopts` fills with the last parsed option argument
- `<args>` optionally specify argument string to parse, by default `getopts` parses `$@`

### Example
```bash
#!/bin/bash
function parse_args() {
    while getopts "f:c" PARAM; do
        case $PARAM in
            f) echo "GOT -f $OPTARG";;
            c) echo "GOT -c";;
            *) echo "ERR: print usage"; exit 1;;
        esac
    done
    # users responsibility to reset OPTIND
    OPTIND=1
}

parse_args -f xxx -c
parse_args -f yyy
```

## Regular Expressions

Bash supports regular expression matching with the binary operator `=~`.
The match results can be accessed via the `$BASH_REMATCH` variable:
- `${BASH_REMATCH[0]}` contains the full match
- `${BASH_REMATCH[1]}` contains match of the first capture group

```bash
INPUT='title foo : 1234'
REGEX='^title (.+) : ([0-9]+)$'
if [[ $INPUT =~ $REGEX ]]; then
    echo "${BASH_REMATCH[0]}"    # title foo : 1234
    echo "${BASH_REMATCH[1]}"    # foo
    echo "${BASH_REMATCH[2]}"    # 1234
fi
```
> **Caution**: When specifying a `regex` in the `[[ ]]` block directly, quotes will be treated as part of the pattern.
> `[[ $INPUT =~ "foo" ]]` will match against `"foo"` not `foo`!
