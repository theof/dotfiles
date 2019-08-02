eval $(ssh-agent)
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
xrdb -merge ~/.Xresources
xrandr --output HDMI2 --right-of eDP1 --scale-from 3840x2160
~/.fehbg &
exec i3
