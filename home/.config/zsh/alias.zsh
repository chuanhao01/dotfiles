# ######  ####  #    #      ##   #      #   ##    ####  
#     #  #      #    #     #  #  #      #  #  #  #      
#    #    ####  ######    #    # #      # #    #  ####  
#   #         # #    #    ###### #      # ######      # 
#  #     #    # #    #    #    # #      # #    # #    # 
# ######  ####  #    #    #    # ###### # #    #  ####  
#
# chuanhao01'szsh alias
#

# This file contains the alias I created to be used in zsh

# Docker and docker-compose
alias dc='docker-compose'

# BBSwitch and GPU related alias
alias gpu_on='sudo tee /proc/acpi/bbswitch <<< ON'
alias gpu_off='sudo tee /proc/acpi/bbswitch <<< OFF'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gl='git log --format="%C(auto)%h - %C(bold yellow)%cn %C(bold green)(%cd) %C(auto)%s%d" --graph --color=always --date=format:"%d %b(%m) %Y, %H:%M:%S"'
alias gc='git commit'
alias gf='git fetch'
alias gb='git branch'
alias gch='git checkout'
alias gp='git push'
alias gpu='git pull'
# new
alias gr='git reset'
alias gm='git merge'
alias gst='git stash'

# Audio output
aoutput (){
	pacmd list-sinks | grep -e 'name:' -e 'index:'
}

# Common commands
alias bd='cd $OLDPWD'
alias c='clear'
alias o='xdg-open'
alias lbo='libreoffice'
# Screenshot alias no longer needed
#alias sc='import png:- | xclip -selection clipboard -t image/png'
alias ta='tmux attach'

alias updatetime='sudo ntpdate 0.us.pool.ntp.org'

alias copy='xclip -selection c' # To pipe stdout to clipboard
