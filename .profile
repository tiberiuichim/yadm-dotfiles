# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH:$HOME/anaconda3/bin"

export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/Software/go"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
if [ -e /home/tibi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/tibi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
