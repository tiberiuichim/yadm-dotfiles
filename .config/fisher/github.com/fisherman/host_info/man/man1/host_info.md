host_info(1) -- Get user and host / domain information
======================================================

## SYNOPSIS

host_info [*format*]<br>

## USAGE

Get user and host / domain information.

```fish
host_info
bucaran@mbp
```

## EXAMPLES

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
