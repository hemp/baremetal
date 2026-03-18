# git notes

<https://wiki.archlinux.org/title/SSH_keys>


```sh
# signingKey ->
gpg --list-secret-keys --keyid-format=long
```

`.gitconfig` example:

```ini
[user]
    name = 
    email = 
    user = 
    signingKey = 

[core]
    sshCommand = ssh -i ~/.ssh/id_ed25519

[commit]
    gpgsign = true
```

`~/.ssh/config` 

```
Host *
  AddKeysToAgent yes
```

One off:

```sh
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519" git clone ...
```