#!/bin/bash
rm -rf ~/.config/nvim/ ~/.cache/nvim/ ~/.local/share/nvim/
sudo apt install neovim fzf -y
mkdir ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -f init.vim ~/.config/nvim/init.vim
echo "Dont close the tab it will get back to your normal terminal once its finished" | nvim -c ":PlugInstall | qa!" - 
cp -f setup/tokyonight-fix.vim ~/.local/share/nvim/plugged/tokyonight-vim/colors/tokyonight.vim
echo "Use nvim command"
