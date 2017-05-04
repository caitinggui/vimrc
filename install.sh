#!/bin/bash
# @author ciaitnggui<caitinggui@qq.com>

[[ -d ~/.vim ]] || mkdir ~/.vim || echo 'create ~/.vim'

# vim pulgin controller - vundle
[[ -d ~/.vim/bundle/Vundle.vim  ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;

if [ -e .vimrc ]
then
	echo '.vimrc exists'
    cp .vimrc ~/
else
	echo '.vimrc not exists, exit'
	exit -1
fi

# judge OS
source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    OS='debian'
	os_install='sudo apt-get'
	;;
centos|fedora|rhel)
    OS='centos'
	os_install='sudo yum'
	;;
esac

# install basic environment
echo 'install basic environment'
sudo pip install autopep8
sudo pip install flake8
$os_install install ctags

# install vim plugin
echo 'install vim plugin'
vim +PluginInstall! +qall;

# install YouCompleteMe
echo 'install YouCompleteMe, and it will cost some time'
if [[ -d ~/.vim/bundle/YouCompleteMe  ]]; then
    echo "YouCompleteMe Exists";
else
    cd ~/.vim/bundle/YouCompleteMe;
	if [ $OS='centos' ]
	then
		$os_install install cmake
		$os_install groupinstall "Developments Tools"
	fi
	./install.py --clang-completer
fi;

echo 'setup completed successfully'
