# vimrc
A beautiful vim IDE for Python

首先确保vim版本大于, python版本大于2.6（YouCompleteMe暂不支持python3）



安装方法：


1、复制.vimrc到~/


2、$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


3、$ vim


  :PluginInstall


4、安装必要的环境：


  $ sudo pip install autopep8


  $ sudo python2 -m pip install flake8  # 安装flake8包


5、安装YouCompleteMe：（如果有异常请参考官方文档）


  $ sudo yum install cmake  # centos的依赖环境


  $ sudo yum groupinstall "Development Tools"  


  $ cd ~/.vim/bundle/YouCompleteMe # 进行YCM编译


  $ ./install.py --clang-completer     # --clang-completer表示支持C类语言的代码补全




使用方法：


F2:  nerdtree，文件目录关闭打开


F5:  运行文件


F7:  静态代码检查


\<leader\>cc, cu:  多行注释, 取消注释


\<space\>:  代码折叠


Tab:  代码补全


\<leader\>g:  跳转到定义处


:Autopep8:  采用pep8格式化代码


Ctrl + p:  项目文件查找
