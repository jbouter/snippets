# Required software
* owncloud (daemon gets started in i3/config)
* rofi (or dmenu, but then you need to change the config around)
* chromium (used as mod+b browser launcher)
* feh (for setting wallpaper)
* scrot (for screenshotting)
* xautolock (for automatic screenlocking)
* alsa-utils (for volume control)
* redshift (to ease your eyes after it gets dark)
* rxvt-unicode (terminal emulator, basic config is in urxvt directory)
* Fira fonts (otf-fira-mono and otf-fira-sans)
* Iosevka (ttf-iosevka-ibx)
* Ubuntu Fonts (ttf-ubuntu-font-family-ib)
* Font Awesome (used for icons in bar, AUR: ttf-font-awesome)
* compton
* Teiler (AUR: teiler-git)
* i3blocks (with gaps) (AUR: i3blocks-gaps-git)
* i3lock-fancy (AUR: i3lock-fancy-git)
* YeaLink Monitor (github: https://github.com/fdev/snippets/blob/master/yealink-monitor.py)
* i3block modules (included in this repo)

# Installation of i3 + urxvt theme
There are three basic directories. My installation is as follows


The configuration directory is symlinked to ~/.config/i3

urxvt/Xresources is symlinked to ~/.Xresources

networkmanager-dmenu is symlinked to ~/.config/networkmanager-dmenu

As such:
```
ln -sf configuration ~/.config/i3
ln -sf urxvt/Xresources ~/.Xresources
ln -sf networkmanager-dmenu ~/.config/networkmanager-dmenu
```

# i3blocks modules
Copy the files in i3blocks-modules to /usr/libexec/i3blocks/

# Getting a timed wallpaper (I use my buck wallpapers, not included)
I moved from using the below configuration (with Systemd) to WeatherDesk.

More information: https://github.com/bharadwaj-raju/WeatherDesk

**!Below configuration is only present for backport reasons!**

Adjust your username in systemd/changewallpaper.service (now set to jeffrey)

copy the two files in the systemd directory to /usr/lib/systemd/system and enable them


As such:
```
sudo cp systemd/changewallpaper.* /usr/lib/systemd/system
sudo systemctl enable changewallpaper.timer
```
The wallpaper script depends on DISPLAY to be set in order to work with systemd. This defaults to ":0.0", but some screens are on a different display.


In order to make this work, try the following whilst logged in to a graphical desktop:
```
echo $DISPLAY > ~/.config/i3/display.txt
```
