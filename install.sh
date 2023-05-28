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

# Putting init.vim file
echo "IiBWaW0tUGx1ZyBJbnN0YWxsaW5nIFBsdWdpbnMKY2FsbCBwbHVnI2JlZ2luKCkKUGx1ZyAnaXRjaHlueS9saWdodGxpbmUudmltJwpQbHVnICd0cG9wZS92aW0tc2Vuc2libGUnClBsdWcgJ2p1bmVndW5uL2Z6Zi52aW0nClBsdWcgJ2p1bmVndW5uL2Z6ZicsIHsgJ2RvJzogeyAtPiBmemYjaW5zdGFsbCgpIH0gfQpQbHVnICdwcmVzZXJ2aW0vbmVyZHRyZWUnClBsdWcgJ21oaW56L3ZpbS1zdGFydGlmeScKUGx1ZyAnbW9yaGV0ei9ncnV2Ym94JwpQbHVnICdTaG91Z28vZGVvcGxldGUubnZpbScsIHsgJ2RvJzogJzpVcGRhdGVSZW1vdGVQbHVnaW5zJyB9ClBsdWcgJ2doaWZhcml0NTMvdG9reW9uaWdodC12aW0nClBsdWcgJ3pjaGVlL2Rlb3BsZXRlLWplZGknClBsdWcgJ21vcmhldHovZ3J1dmJveCcKY2FsbCBwbHVnI2VuZCgpCgoiIE5lcmRUcmVlIGNvbmZpZ3VyYXRpb24Kbm5vcmVtYXAgPHNpbGVudD4gPEYyPiA6TkVSRFRyZWVUb2dnbGU8Q1I+Cm5ub3JlbWFwIDxzaWxlbnQ+IDxGMT4gOk5FUkRUcmVlPENSPgoKIiBNeSBvdGhlciBiYXNpYyBjb25maWd1cmF0aW9uIApzZXQgbnVtYmVyCnNldCBleHBhbmR0YWIKc2V0IGF1dG9pbmRlbnQKc2V0IHNvZnR0YWJzdG9wPTQKc2V0IHNoaWZ0d2lkdGg9MgpzZXQgdGFic3RvcD00CnNldCBzY3JvbGxvZmY9NwpzZXQgbW91c2U9YQpzZXQgZ3VpY3Vyc29yPSAKaW5vcmVtYXAgPFMtVGFiPiA8Qy1kPgpzZXQgbGlzdCBsaXN0Y2hhcnM9dGFiOj5cICx0cmFpbDorLGVvbDokCnNldCB3aGljaHdyYXArPTwsPixbLF0Kbm5vcmVtYXAgPHNpbGVudD4gPEMtTGVmdD4gOnRhYnByZXZpb3VzPENSPgpubm9yZW1hcCA8c2lsZW50PiA8Qy1SaWdodD4gOnRhYm5leHQ8Q1I+Cm5ub3JlbWFwIDxzaWxlbnQ+IDxDLVVwPiA6c3BsaXQ8Q1I+Cm5ub3JlbWFwIDxzaWxlbnQ+IDxDLURvd24+IDp2c3BsaXQ8Q1I+Cm5ub3JlbWFwIDxzaWxlbnQ+IDxDLVQ+IDp0YWJlPENSPgpubm9yZW1hcCA8c2lsZW50PiA8Qy1xPiA6cSE8Q1I+Cm5ub3JlbWFwIDxzaWxlbnQ+IDxDLXM+IDp3PENSPgp2bWFwIDxDLXk+ICIreQpubm9yZW1hcCA8c2lsZW50PiA8U3BhY2U+IDpuPENSPgpubm9yZW1hcCA8c2lsZW50PiA8QmFja1NwYWNlPiA6TjxDUj4Kbm5vcmVtYXAgPHNpbGVudD4gPEMtZj4gOkZpbGVzIC88Q1I+IApzZXQgbm9zaG93bW9kZQpzZXQgbnVtYmVyIHJlbGF0aXZlbnVtYmVyCmxldCBnOmRlb3BsZXRlI2VuYWJsZV9hdF9zdGFydHVwID0gMQpzZXQgc3BsaXRiZWxvdwphdXRvY21kIEluc2VydExlYXZlLENvbXBsZXRlRG9uZSAqIGlmIHB1bXZpc2libGUoKSA9PSAwIHwgcGNsb3NlIHwgZW5kaWYKaW5vcmVtYXAgPGV4cHI+PHRhYj4gcHVtdmlzaWJsZSgpID8gIlw8Yy1uPiIgOiAiXDx0YWI+Igpjb21tYW5kISAtbmFyZ3M9KiBXIHcKc2V0IGNvbXBsZXRlKz1rc3BlbGwKc2V0IGNvbXBsZXRlb3B0PW1lbnVvbmUsbG9uZ2VzdApsZXQgJEZaRl9ERUZBVUxUX0NPTU1BTkQgPSAnZmluZCAuIC10eXBlIGYnCnNldCBjdXJzb3JsaW5lCnNldCBndWljdXJzb3I9bi12LWMtc206YmxvY2ssaS1jaS12ZTp2ZXIyNS1DdXJzb3Isci1jci1vOmhvcjIwCnNldCB0ZXJtZ3VpY29sb3JzCmNvbG9yc2NoZW1lIGdydXZib3gKIiBsZXQgZzp0b2t5b25pZ2h0X3N0eWxlID0gJ25pZ2h0JwoiIGxldCBnOnRva3lvbmlnaHRfZW5hYmxlX2l0YWxpYyA9IDEKIiBjaGVja3MgaWYgeW91ciB0ZXJtaW5hbCBoYXMgMjQtYml0IGNvbG9yIHN1cHBvcnQKaWYgKGhhcygidGVybWd1aWNvbG9ycyIpKQogICAgc2V0IHRlcm1ndWljb2xvcnMKICAgIGhpIExpbmVOciBjdGVybWJnPU5PTkUgZ3VpYmc9Tk9ORQplbmRpZgpsZXQgZzpsaWdodGxpbmUgPSB7CiAgICBcICdjb2xvcnNjaGVtZSc6ICdncnV2Ym94JywKICAgIFwgJ2NvbXBvbmVudCc6IHsKICAgIFwgICAnbGluZWluZm8nOiAn7oKhICUzbDolLTJ2JywKICAgIFwgfSwKICAgIFwgJ2NvbXBvbmVudF9mdW5jdGlvbic6IHsKICAgIFwgICAncmVhZG9ubHknOiAnTGlnaHRsaW5lUmVhZG9ubHknLAogICAgXCAgICdmdWdpdGl2ZSc6ICdMaWdodGxpbmVGdWdpdGl2ZScKICAgIFwgfSwKICAgIFwgJ3NlcGFyYXRvcic6IHsgJ2xlZnQnOiAn7oKwJywgJ3JpZ2h0JzogJ+6CsicgfSwKICAgIFwgJ3N1YnNlcGFyYXRvcic6IHsgJ2xlZnQnOiAn7oKxJywgJ3JpZ2h0JzogJ+6CsycgfQogICBcIH0KZnVuY3Rpb24hIExpZ2h0bGluZVJlYWRvbmx5KCkKICAgIHJldHVybiAmcmVhZG9ubHkgPyAn75GWJyA6ICcnCmVuZGZ1bmN0aW9uCmZ1bmN0aW9uISBMaWdodGxpbmVGdWdpdGl2ZSgpCiAgICBpZiBleGlzdHMoJypmdWdpdGl2ZSNoZWFkJykKICAgICAgICBsZXQgYnJhbmNoID0gZnVnaXRpdmUjaGVhZCgpCiAgICAgICAgcmV0dXJuIGJyYW5jaCAhPSMgJycgPyAn7oKgJy5icmFuY2ggOiAnJwogICAgZW5kaWYKICAgIHJldHVybiAnJwplbmRmdW5jdGlvbgo=" | base64 -d > ~/.config/nvim/init.vim

if [[ $(which pip &>/dev/null | echo $?) == 0 ]];
then
  sudo pip install pynvim
  sudo pip install jedi
else
  echo "[+] Install python3 - pip and run the script again"
  exit 1
fi

echo "$(for msg in `seq 150`;do echo '[*] Dont close the tab it will get back to your normal terminal once its finished';done)" | nvim -c ":PlugInstall | qa!" - 
echo "$(for msg in `seq 150`;do echo '[*] Dont close the tab it will get back to your normal terminal once its finished';done)" | nvim -c ":UpdateRemotePlugins | qa!" - 

# Creating a link of nvim 
sudo ln -s /usr/local/bin/v $(which nvim) &>/dev/null
sudo chmod +x /usr/local/bin/v
echo "[*](COMMAND)=> ${USER}@${HOSTNAME}: v"

