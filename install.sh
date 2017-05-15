#!/bin/bash
# @author ciaitnggui<caitinggui@qq.com>

[[ -d ~/.vim ]] || mkdir ~/.vim

# judge OS
source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    OS='debian'
	os_install='sudo apt-get'
	;;
centos)
    OS='centos'
	os_install='sudo yum'
	;;
*)
	echo 'This script do not support your system'
	exit 1
	;;
esac
#centos|fedora|rhel)

# check git exists or not
if hash git 2>/dev/null; then
	echo 'git exists'
else
	echo 'install git'
	$os_install install -y git
fi

# check .vimrc exists or not
if [ -e .vimrc ]
then
	echo '.vimrc exists'
    cp .vimrc ~/
else
	echo '.vimrc not exists, exit'
	exit -1
fi


# vim pulgin controller - vundle
echo 'install Vundle'
if [[ -d ~/.vim/bundle/Vundle.vim  ]]; then
    echo 'Vundle exists'
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi

# install basic environment
echo 'install basic environment'
sleep 1
if type pip >/dev/null 2>&1; then
	echo 'pip exists'
else
	if [ $OS = 'centos' ]; then
		$os_install install -y epel-release
	fi
	$os_install install -y python-pip
fi
sudo pip install autopep8
sudo pip install flake8
# For tagbar
$os_install install -y ctags

# For YouCompleteMe, python-dev and ctrlsf
if [ $OS = 'centos' ]
then
    $os_install install -y ack
	$os_install install -y cmake;
	$os_install groupinstall -y "Development Tools";

elif [ $OS = 'debian' ]
then
    $os_install install -y ack-grep
    $os_install install -y python-dev python3-dev;
    $os_install install -y build-essential cmake;
fi

# install vim plugin
echo 'install vim plugin, and it will cost some minutes'
sleep 1
vim +PluginInstall +qall;

# install YouCompleteMe
echo 'install YouCompleteMe, and it will cost some time'
sleep 1
cd ~/.vim/bundle/YouCompleteMe;
./install.py --clang-completer;

echo 'install completed'
