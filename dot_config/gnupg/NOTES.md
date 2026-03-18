# gnupg notes

Default: `/Users/<user>/.gnupg`

## Config

`ttl` is in seconds.

```sh
cat ~/.gnupg/gpg-agent.conf

## 7-day timeout
default-cache-ttl 604800
max-cache-ttl 604800

## 1-day timeout
default-cache-ttl 86400
max-cache-ttl 86400

gpgconf --list-options gpg-agent
```

## Trigger a Prompt

```sh
echo | gpg --clearsign > /dev/null
```

## Clear passphrase cache

```sh
gpg-connect-agent reloadagent /bye
```
