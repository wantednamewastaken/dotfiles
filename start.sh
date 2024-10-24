#!/bin/env bash
#

needed_Dirs=("$HOME/.config" "$HOME/.local/share/" "$HOME/Pictures")

make_Dirs () {
    for DIR in needed_Dir; do
        if [[ -e $DIR ]]; then
            echo "$DIR already exists"
            continue
        else
            mkdir -p $DIR
        fi
    done
}

link () {
    if [[ -e $2 ]]; then
        echo "File: '$2' already exists"
    else
        ln -s $1 $2
    fi
}

make_Dirs

link ./.zshrc $HOME
link ./.oh-my-zsh $HOME
link ./.p10k.zsh $HOME

### Not sure if this should be done automatically (fresh install)
# sudo link ./nix/configuration.nix /etc/nixos

link ./config/i3 $HOME/.config
link ./config/i3status $HOME/.config
link ./.themes $HOME
link ./.icons $HOME
link ./.vim $HOME
link ./local/nvim $HOME/.local/share
link ./local/fonts $HOME/.local/share

link ./.tmux.conf $HOME
link ./.tmux $HOME
link ./wallpapers $HOME/Pictures
