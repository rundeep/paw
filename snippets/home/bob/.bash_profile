#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# The Solarized color theme
eval `dircolors ~/.dircolors.d/dircolors.ansi-dark`

## Restore ALSA Mixer settings at login
alsactl -f ~/.asound.state restore

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
