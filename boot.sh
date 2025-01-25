set -e

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Rebuntu..."
rm -rf ~/.local/share/rebuntu
git clone https://github.com/gnfisher/rebuntu.git ~/.local/share/rebuntu >/dev/null

echo "Installation starting..."
source ~/.local/share/rebuntu/install.sh
