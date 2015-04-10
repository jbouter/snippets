#!/bin/bash

TELEDOWNLOAD=~/Downloads/telegram-upgrade.tar.xz
TELEPATH=~/.local/share/

# Do the downloading part
wget "https://tdesktop.com/linux" -O $TELEDOWNLOAD

cd $TELEPATH

# Extract the downloaded telegram package
tar -xf $TELEDOWNLOAD

# Clean up the downloaded telegram package
rm $TELEDOWNLOAD


# Check if ~/.local/bin exists
if [ ! -d ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi

# Check for symbolic link
if [ ! -h ~/.local/bin/Telegram ]; then
  ln -s ~/.local/share/Telegram/Telegram ~/.local/bin/Telegram
  echo "Symbolic link has been put in place. Please make sure ~/.local/bin is in your PATH variable"
fi

echo "All done"

exit 0
