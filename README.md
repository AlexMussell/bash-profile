# Bash Profile 

## UBUNTU
```bash
./ubuntu.sh
```

## VIM
```bash
vim ~/.vimrc
:PlugInstall
```


## OSX (Updating)
cat brew.txt | xargs brew install

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
