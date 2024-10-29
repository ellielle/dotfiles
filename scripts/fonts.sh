mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d FiraCode 
cp FiraCode/*.ttf ~/.local/share/fonts
rm -rf FiraCode.zip FiraCode

fc-cache
cd -
