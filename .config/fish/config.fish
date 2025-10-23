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
set -gx DISPLAY ":0"

if not string match -q -- $CUDA_HOME $PATH
    set -gx PATH "$CUDA_HOME/bin" $PATH
end

# source ~/.asdf/asdf.fish

set -gx PATH /home/tibi/bin $PATH

# Source environment variables from ~/.secret_keys
if test -f "$HOME/.secret_keys"
    for line in (cat "$HOME/.secret_keys")
        if string match -q "export *" "$line"
            # Remove 'export ' prefix
            set -l export_line (string replace "export " "" "$line")

            # Split by the first '='
            set -l parts (string split -m 1 "=" "$export_line")

            if test (count $parts) -eq 2
                set -l var_name (string trim "$parts[1]")
                set -l var_value (string trim "$parts[2]")

                # Remove quotes if present around the value
                if string match -q '"*"' "$var_value"
                    set var_value (string replace -r '^"|"$|^'\''|'\''$' "" "$var_value")
                end

                # Set and export the variable
                set -gx "$var_name" "$var_value"
            end
        end
    end
end


# cat ~/.source_keys | grep '^export ' | sed -E 's/^export ([^=]+)=(.*)$/set -gx \1 \2/'
# for s in (bash -c 'source ~/.secret_keys > /dev/null && env' | string match -r '^[^=]+=' --all)
#     set -gx (string split = $s)[1] (string split = $s)[2]
# end
# uv
fish_add_path "/home/tibi/.local/bin"
