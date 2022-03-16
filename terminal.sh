#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    #install zsh
    echo "Installing zsh"
    sudo apt install zsh -y
    #install powerlevel10k
    echo "Installing powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    #install Oh My Zsh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    #set zsh as default shell
    echo "Setting zsh as default shell"
    chsh -s $(which zsh)
    echo "Download the following fonts (4 total) and set MesloLGS NF as the font for the terminal to view symbols properly."
    echo "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    echo "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    echo "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    echo "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
else
    echo "Do not run script as root (sudo)."
fi