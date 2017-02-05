# Path to Oh My Fish install.
# set -q XDG_DATA_HOME
#   and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
#   or set -gx OMF_PATH "$HOME/.local/share/omf"
#
# # Load Oh My Fish configuration.
# source $OMF_PATH/init.fish
# omf theme shellder
# omf theme bobthefish

# disable virtualenv prompt, already taken care by theme
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# bobthefish theme options
set -g theme_display_git yes
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose no
set -g theme_git_worktree_support no
set -g theme_display_vagrant no
set -g theme_display_docker_machine no
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user yes
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
# set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user tibi
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 256
set -g theme_project_dir_length 0

set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path no

set theme_color_scheme default
