#!/bin/sh
swaylock -i ~/.config/background4k.png -s stretch &
disown
sleep 1
exec xset dpms force off
