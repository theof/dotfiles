#!/bin/sh
i3lock -i /data/Images/Wallpapers/palenight.png &
disown
sleep 1
exec xset dpms force off
