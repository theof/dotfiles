#!/bin/sh
i3lock -i ~/.config/background4k.png -t &
disown
sleep 1
exec xset dpms force off
