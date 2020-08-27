# Snippets repository
Everything you'll find in here serves as a sort-of backup for what I am using or have used in the past. Feel free to browse through, use and modify whatever you find.


## Git config
run:
```bash
git config --global alias.tree "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches --date-order"
```

## Notegen requirements

* Install eisvogel as documented on [roaldnefs/writeup-template](https://github.com/roaldnefs/writeup-template)
* Built for the latest version of pandoc, with support for `--pdf-engine` instead of `--latex-engine`

Eisvogel documentation can be found on [GitHub](https://github.com/Wandmalfarbe/pandoc-latex-template)

## Borg automation

Place `borgbackup.sh` in `/usr/local/sbin/` with rights `0750`

Adjust `borgbackup.sh` according to your needs (username, paths in pass)

Place `borgbackup.service` and `borgbackup.timer` in `/etc/systemd/system/`

Enable and start the systemd timer.

```bash
# Run below commands as root or prepend sudo
cp borgbackup.sh /usr/local/sbin/
vim /usr/local/sbin/borgbackup.sh
chmod 0755 /usr/local/sbin/borgbackup.sh
cp borgbackup.{service,timer} /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now borgbackup.timer
```
