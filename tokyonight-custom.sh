#!/bin/bash
#!/bin/bash

# Creating directory of neovim configuration
echo "[+] Removing Old configuration File"
rm -rf ~/.config/nvim/ ~/.cache/nvim/ ~/.local/share/nvim/
mkdir -p ~/.config/nvim

# Checking and installing neovim and fzf package
if [[ $(which nvim &>/dev/null ; which fzf &>/dev/null; echo $?) != 0 ]];
then
  if [[ $(which apt &>/dev/null ; echo $?) == 0 ]];
  then
    sudo apt install neovim fzf -y;
  elif [[ $(which yum &>/dev/null ; echo $?) == 0 ]];
  then
    sudo yum -y install neovim fzf;
  elif [[ $(which pacman &>/dev/null ; echo $? ) == 0 ]];
  then
    sudo pacman -S neovim fzf;
  else
    echo "[+] Can not installed package neovim and fzf"
  fi
fi

# Installing plugins and vim plug
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -f tokyonight-custom.vim ~/.config/nvim/init.vim 
echo "$(for msg in `seq 150`;do echo '[*] Dont close the tab it will get back to your normal terminal once its finished';done)" | nvim -c ":PlugInstall | qa!" - 
cp -f setup/tokyonight-fix.vim ~/.local/share/nvim/plugged/tokyonight-vim/colors/tokyonight.vim

# Creating a link of nvim 
sudo ln -s /usr/local/bin/v $(which nvim)
sudo chmod +x /usr/local/bin/v
echo "[*](COMMAND)=> ${USER}@${HOSTNAME}: v"

