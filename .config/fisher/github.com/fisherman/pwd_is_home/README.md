[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# Pwd_is_home

Test if cwd equals or is a sub directory of HOME.

## Install

With [fisherman]

```
fisher pwd_is_home
```

## Usage

```fish
if pwd_is_home
    printf "$PWD is $HOME\n"
end
```

[travis-link]: https://travis-ci.org/fisherman/pwd_is_home
[travis-badge]: https://img.shields.io/travis/fisherman/pwd_is_home.svg
[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
