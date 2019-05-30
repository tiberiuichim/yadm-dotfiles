if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# eval $HOME/tools3/bin/python -m virtualfish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval (eval /home/tibi/anaconda3/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

