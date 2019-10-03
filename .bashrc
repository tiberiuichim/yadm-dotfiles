#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nvim
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NIXSH="$HOME/.nix-profile/etc/profile.d/nix.sh"
# if [ -f $NIXSH ]; then
#   . $NIXSH
# fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export SHELL=/usr/bin/fish
# exec fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tibi/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tibi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tibi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tibi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

