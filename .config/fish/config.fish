if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -e /home/tibi/miniconda3/bin/conda
    eval /home/tibi/miniconda3/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<


# pnpm
set -gx PNPM_HOME "/home/tibi/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# tibi cuda
set -gx CUDA_HOME "/usr/local/cuda-12.3"

if not string match -q -- $CUDA_HOME $PATH
    set -gx PATH "$CUDA_HOME/bin" $PATH
end

source ~/.asdf/asdf.fish

set -gx PATH /home/tibi/bin $PATH
