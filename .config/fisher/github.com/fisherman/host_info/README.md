[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# Host_info

Get user and host / domain information.

## Install

With [fisherman]

```
fisher host_info
```

## Usage

```fish
host_info [format]
```

Get user and host information.

```fish
host_info
bucaran@mbp
```

## Examples

Use _format_ to customize the output.

```fish
host_info domain.host@~user
local.mbp@~bucaran
```

Shorten the user name with _usr_.

```fish
host_info usr~:host/domain
b~:mbp/local
```

[travis-link]: https://travis-ci.org/fisherman/host_info
[travis-badge]: https://img.shields.io/travis/fisherman/host_info.svg
[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
