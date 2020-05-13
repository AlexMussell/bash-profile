# Bash Profile (GNOME)
```bash
echo "source $PWD/.bash_profile" >> ~/.bash_profile
ln -s $PWD/.config $HOME/.config
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.alacritty.yml $HOME/.config/alacritty/alacritty.yml
```

# Alacritty
```bash
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
```

## VIM
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/undodir

vim ~/.vimrc
:PlugInstall

sudo apt install build-essential cmake vim python3-dev
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

## diff-so-fancy  Ubuntu
sudo apt-get install wget
mkdir $HOME/ad-hoc
export PATH=$PATH:$HOME/ad-hoc
wget -O $HOME/ad-hoc https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x $HOME/ad-hoc/diff-so-fancy






cat brew.txt | xargs brew install
```

diff-so-fancy: https://github.com/so-fancy/diff-so-fancy

Switch your default shell to the version of bash installed by brew (as pre-installed version on mac is out of date).

```shell
sudo sh -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
```

Setup iTerm2
```shell
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$PWD/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

Install Source Code Pro font
```shell
brew tap caskroom/fonts
brew cask install font-source-code-pro
```
