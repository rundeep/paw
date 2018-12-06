# # ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable auto-complete after sudo and man
complete -cf sudo
complete -cf man

# Bash history completion bound to arrow keys (down, up)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/bin:$GOBIN
export EDITOR="vim"
export VISUAL=$EDITOR
export PAGER="most"
#export PAGER=$EDITOR # external viewer in Midnight Commander
export BROWSER=/usr/bin/firefox
export COLORTERM=truecolor
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export LD_LIBRARY_PATH=/usr/lib:/usr/lib/vmware/lib/libcurl.so.4
export GIT_TERMINAL_PROMPT=1
# ruby gem
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias ls='ls -hF --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias cleanconfig='sed -e '\''s/#.*//'\'' -e '\''s/[ ^I]*$//'\'' -e '\''/^$/ d'\'''
PS1='[\u@\h \W]\$ '

# a skin of your choice loaded instead of mc's default skin on 16-color terminal
if [ $TERM = "linux" ]; then
  export MC_SKIN=/usr/share/mc/skins/gotar.ini
elif [ $TERM = "st-256color" ]; then
  export MC_SKIN=/usr/share/mc/skins/yadt256.ini
elif [ $TERM = "tmux-256color" ]; then
  export MC_SKIN=/usr/share/mc/skins/seasons-spring16M.ini
fi

# After quit from mc, shell wil automaticaly cd to same dir
alias mc=". /usr/lib/mc/mc-wrapper.sh"
