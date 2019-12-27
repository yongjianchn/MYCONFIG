THISDIR=`pwd`


# Backup
BACKUPNAME="backup-`date +%y-%m-%d-%H:%M:%S`"
mkdir $BACKUPNAME

function backup {
	cp -r $@ $BACKUPNAME
}

echo "Start to setup..."
echo "Old config was in $BACKUPNAME"

# Bash
backup ~/.bashrc
ln -sf $THISDIR/_bashrc ~/.bashrc
ln -sf $THISDIR/_testbash.py ~/.testbash.py

# Git
backup ~/.gitconfig
ln -sf $THISDIR/_gitconfig ~/.gitconfig

# tmux
backup ~/.tmux.conf
ln -sf $THISDIR/_tmux.conf ~/.tmux.conf

# Vim
backup ~/.vim ~/.vimrc
env rm -r ~/.vim ~/.vimrc
ln -s $(pwd)/_vim ~/.vim
ln -s $(pwd)/_vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
