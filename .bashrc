# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# --- Basic Environment ---
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/nvim
# Ensure the shell stays as bash for compatibility with IDE tools
export SHELL=/bin/bash
# --- Aliases ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias grep='grep --color=auto'
# --- Prompt ---
PS1='[\u@\h \W]\$ '
# --- NVM (Node Version Manager) ---
# Essential for managing Node.js versions in this project
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# --- System Tweaks ---
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# --- FZF (Optional - keep if you use it in bash) ---
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
