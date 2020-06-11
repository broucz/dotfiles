# Initial

1. Run `git` in `Terminal.app` and install developers tools.

2. Clone and run `dotfiles`.

3. Setup VS Code by using dedicated config files.

# Fish

```
echo /usr/local/bin/fish | sudo tee -a /etc/shells
```

```
chsh -s /usr/local/bin/fish
```

# Github

Setup ssh key:

https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Generate personnal access token:

https://medium.com/@ginnyfahs/github-error-authentication-failed-from-command-line-3a545bfd0ca8

Remember to keep the private key / identity in the keychain to avoid having to write the passphrase all the time:

```
ssh-add -K ~/.ssh/id_rsa
```

Setup commit signature:

https://help.github.com/en/github/authenticating-to-github/managing-commit-signature-verification

