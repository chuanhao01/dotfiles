# ######  ####  #    #    ###### #    # #####   ####  #####  #####  ####  
#     #  #      #    #    #       #  #  #    # #    # #    #   #   #      
#    #    ####  ######    #####    ##   #    # #    # #    #   #    ####  
#   #         # #    #    #        ##   #####  #    # #####    #        # 
#  #     #    # #    #    #       #  #  #      #    # #   #    #   #    # 
# ######  ####  #    #    ###### #    # #       ####  #    #   #    ####  
#
# chuanhao01's zsh exports
#

# This file contains all the zsh exports used by me

# --- Own Exports ---
# Old KDE configs for i3 integrtion with KDE applications, blueman and dolphin
# Making sure dolphin icons work
#export XDG_CURRENT_DESKTOP=KDE
# KDE
#export XDG_CURRENT_DESKTOP="KDE"
#export QT_QPA_PLATFORMTHEME="qt5ct"

# GPG TTY
export GPG_TTY=$TTY

# Docker
export DOCKER_BUILDKIT='1' # Buildkit so docker go brrrr
export COMPOSE_DOCKER_CLI_BUILD=1 # docker-compose buildkit go brrrr

# For flutter Path
#export PATH="$PATH:/home/chuanhao01/home/system_files/flutter/bin"

# --- System Preferences ---
# Man path
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_SG.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"
