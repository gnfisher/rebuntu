# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run terminal installers
for installer in ~/.local/share/rebuntu/install/terminal/*.sh; do source $installer; done

# Symlink new bashrc
if [ -f ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc.bak
fi
ln -s ~/.local/share/rebuntu/configs/bashrc ~/.bashrc