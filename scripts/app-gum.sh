# Gum is used for simple UI during install
cd /tmp
GUM_VERSION="0.14.1" # current known good version
wget -O gum.deb "https://github.com/charmbracelet/gum/releases/latest/download/gum_${GUM_VERSION}_amd64.deb"
sudo apt install -y ./gum.deb
rm gum.deb
cd -
