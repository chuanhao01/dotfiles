# ######  ####  #    #    ###### ###### ###### 
#     #  #      #    #    #          #  #      
#    #    ####  ######    #####     #   #####  
#   #         # #    #    #        #    #      
#  #     #    # #    #    #       #     #      
# ######  ####  #    #    #      ###### #    
#
# chuanhao01's zsh fzf configs
#

# This is my configs for fzf use with zsh
# You can find the fzf repo here: https://github.com/junegunn/fzf
# These configs are seperated because there are quite a few configs that need to work with each other
# As such placing them in the same file made more sense

# fzf with ripgrep
export FZF_DEFAULT_COMMAND="rg . --files --hidden --no-ignore-vcs"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zsh fzf configs needed for git integeration
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

_gs() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

_gb() {
  is_in_git_repo || return
  git branch -a -vv --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --format="%C(auto)%h - %C(bold yellow)%cn %C(bold green)(%cs) %C(auto)%s%d" --graph --color=always $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

_gl() {
  is_in_git_repo || return
  git log --format="%C(auto)%h - %C(bold yellow)%cn %C(bold green)(%cs) %C(auto)%s%d" --graph --color=always --all |
  # is_in_git_repo || return
  # git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --name-only --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper s b t l
unset -f bind-git-helper
