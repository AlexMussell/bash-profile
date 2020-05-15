ADHOC="~/Documents/ad-hoc"

echo "source $PWD/.bash_profile" >> ~/.bash_profile
ln -s $PWD/.config $HOME/.config
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.alacritty.yml $HOME/.config/alacritty/alacritty.yml

sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install -y alacritty

sudo add-apt-repository ppa:ultradvorka/ppa
sudo apt update
sudo apt install -y hstr build-essential cmake vim python3-dev jq


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/undodir

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
vim -c 'PlugInstall'

mkdir $ADHOC

git clone https://github.com/samoshkin/tmux-config.git $ADHOC
$ADHOC/tmux-config/install.sh


git clone https://github.com/so-fancy/diff-so-fancy.git $ADHOC
export PATH=$PATH:$ADHOC
