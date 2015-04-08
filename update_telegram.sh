#!/bin/bash

TELEDOWNLOAD="~/Downloads/telegram-upgrade.tar.xz"
TELEPATH="~/.local/share/"

wget "https://tdesktop.com/linux" -O $TELEDOWNLOAD

cd $TELEPATH

tar -xf $TELEDOWNLOAD

rm $TELEDOWNLOAD

echo "All done"

exit 0
