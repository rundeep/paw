#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

# urxvt daemon
urxvtd -q -f -o &

# Switching Caps-Lock and Escape with xmodmap
#setxkbmap -option caps:escape

# Отключение энергосбережения
# (don't let screen turn black on regularly)
xset s off -dpms

# Disable PC Speaker Beep
#xset -b


# ... the Window Manager of your choice
# exec gnome-session
# exec startkde
# exec startxfce4
# exec startfluxbox
exec i3
