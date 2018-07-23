#!/bin/sh
i3lock&
disown
sleep 1
exec xset dpms force off
