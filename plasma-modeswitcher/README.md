# Plasma Modeswitcher

## Install the script

Place `plasma-modeswitcher.sh` in `/usr/local/bin/` and give it execute rights:

```bash
sudo cp plasma-modeswitcher.sh /usr/local/bin/
sudo chmod 755 /usr/local/bin/plasma-modeswitcher.sh
```

Edit `$LAT` and `$LON` to reflect your location:

```bash
sudo vim /usr/local/bin/plasma-modeswitcher.sh
```

## Configure the timer

We recommend running the service and timer as your own user, and therefore suggest you run them in systemd user mode. To achieve this, please do the following:

```bash
mkdir -p ~/.local/share/systemd/user
cp plasma-modeswitcher.service ~/.local/share/systemd/user/
cp plasma-modeswitcher.timer ~/.local/share/systemd/user/
```
Then enable the timer:

```bash
systemctl --user daemon-reload
systemctl --user enable --now plasma-modeswitcher.timer
```

## Theming

Want to change the colour scheme or plasma theme? Edit the following files to do so:

```console
/usr/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/defaults
/usr/share/plasma/look-and-feel/org.kde.breezedark.desktop/contents/defaults
```
