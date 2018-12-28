[travis-link]: https://travis-ci.org/fisherman/pwd_info
[travis-badge]: https://img.shields.io/travis/fisherman/pwd_info.svg
[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman

[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# Pwd_info

Print info about the current working directory.

## Install

With [fisherman]

```
fisher pwd_info
```

## Usage

```
pwd_info [separator]
```

In a regular directory.

```fish
cd path/to/my/dir
pwd_info /
dir
p/t/my
↵
```

In a git repo.

```fish
cd path/to/git/repo/sub/dir
pwd_info " "
repo
p t g
sub dir
```
