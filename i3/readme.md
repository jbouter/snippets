# Required software
* owncloud (daemon gets started in i3/config)
* network-manager-applet (gets started in tray)
* chromium (used as mod+b browser launcher)
* feh (for setting wallpaper)
* scrot (for screenshotting + setting lockscreen)
* alsa-utils (for volume control)
* redshift (to ease your eyes after it gets dark)
* rxvt-unicode (terminal emulator, basic config is in urxvt directory)
* iTerm2-colors (git cloned via https://github.com/mbadolato/iTerm2-Color-Schemes)
* overpass (font used in configuration)

# Installation of i3 + urxvt theme
There are three basic directories. My installation is as follows

The configuration directory is symlinked to ~/.config/i3
urxvt/Xdefaults is symlinked to ~/.Xdefaults
As such:
```
ln -sf configuration ~/.config/i3
ln -sf urxvt/Xdefaults ~/.Xdefaults
```

# Getting a timed wallpaper (I use my buck wallpapers, not included)
Adjust your username in systemd/changewallpaper.service (now set to jeffrey)
copy the two files in the systemd directory to /usr/lib/systemd/system and enable them
As such:
```
sudo cp systemd/changewallpaper.* /usr/lib/systemd/system
sudo systemctl enable changewallpaper.timer
```
