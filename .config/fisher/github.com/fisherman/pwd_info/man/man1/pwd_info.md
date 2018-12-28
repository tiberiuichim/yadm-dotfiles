pwd_info(1) -- Print info about the current working directory
=============================================================

## SYNOPSIS

pwd_info [separator]<br>

## USAGE

Inside a regular directory.

```fish
cd path/to/my/dir
pwd_info /
dir
p/t/my
↵
```

Inside a git repository.

```fish
cd path/to/git/repo/sub/dir
pwd_info " "
repo
p t g
sub dir
```
