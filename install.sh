#!/bin/bash
# @author ciaitnggui<caitinggui@qq.com>

[[ -d ~/.vim ]] || mkdir ~/.vim || echo 'create ~/.vim'

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
[[ -d ~/.vim/bundle/Vundle.vim  ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;

# install basic environment
echo 'install basic environment'
if type pip >/dev/null 2>&1; then
	echo 'exists pip'
else
	$os_install install -y python-pip
fi
sudo pip install autopep8
sudo pip install flake8
$os_install install -y ctags

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
	then {
		$os_install install -y cmake;
		$os_install groupinstall -y "Development Tools";
	    ./install.py --clang-completer;
    }
	elif [ $OS='debian' ]
	then {
        $os_install install -y build-essential cmake;
		$os_install install -y python-dev python3-dev;
	    ./install.py --clang-completer;
    }
	else
		echo 'This script can not install YouCompleteMe, please install it manually'
	fi
fi;

echo 'setup completed successfully'
