#!/bin/bash

# Small bash script to updat the Telegram desktop client.
# I wrote this because in-client updates can sometimes brick the configuration files

wget "https://tdesktop.com/linux" -O ~/Downloads/telegram-upgrade.tar.xz

cd ~/.local/share/

tar -xf ~/Downloads/telegram-upgrade.tar.xz

rm ~/Downloads/telegram-upgrade.tar.xz

echo "All done"

exit 0
