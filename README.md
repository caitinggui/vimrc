# vimrc
##### A useful and beautiful vim IDE for Python

首先确保vim版本**大于7.4**, python版本**大于2.6**（YouCompleteMe暂不支持python3）

## 安装方法

1. ### 自动安装:

    在vimrc目录下执行:  
    $ ./install.py

2. ### 手动安装方法：
    1. 复制.vimrc到~/:  
       $ cp .vimrc ~/
    2. $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    3. $ vim  
       :PluginInstall
    4. 安装必要的环境:  

       ```
       $ sudo pip install autopep8
       $ sudo python2 -m pip install flake8  # 安装flake8包
       $ sudo yum install ctags  # for ubuntu: sudo apt-get install ctags
       $ sudo yum install ack  # for ubuntu: sudo apt-get install ack-grep
       ```

    5. 安装YouCompleteMe：（如果有异常请参考官方文档）  
  
       **centos系统下** 
     
       ```
       $ sudo yum install cmake  # centos的依赖环境  
       $ sudo yum groupinstall "Development Tools"  
       $ cd ~/.vim/bundle/YouCompleteMe # 进行YCM编译  
       $ ./install.py --clang-completer     # --clang-completer表示支持C类语言的代码补全
       ```

       **ubuntu系统下**  
     
       ```
       $ sudo apt-get install -y build-essential cmake  
       $ sudo apt-get install -y python-dev python3-dev  
       $ cd ~/.vim/bundle/YouCompleteMe # 进行YCM编译  
       $ ./install.py --clang-completer
       ```

## 使用方法：

1. 常用快捷键
  - F2:  nerdtree，文件目录关闭打开
  - F3:  tagbar，大纲式导航，包括类、函数、变量
  - F4:  主题色彩切换
  - F5:  运行文件
  - F7:  静态代码检查
  - Tab:  代码补全
  - \<leader\>cc, cu:  多行注释, 取消注释
  - \<space\>:  代码折叠
  - \<leader\>g:  跳转到定义处
  - Ctrl + o:  从定义处返回
  - Ctrl + p:  项目文件查找
  - :Autopep8:  采用pep8格式化代码

2. CtrlSF使用方式:  
  - f: 全局字符搜索，输入要搜索的字符后，按\<tab\>可以指定搜索的路径，不指定默认为当前目录  
  - p:在查询的结果中，表示在预览窗口打开该文件，查询结果页不关闭  
  - Enter:跳转到该行，查询结果页自动关闭  

3. NERDTree的快捷键:  
  - ctrl + w + h:    光标 focus 左侧树形目录  
  - ctrl + w + l:    光标 focus 右侧文件显示窗口  
  - ctrl + w + w:    光标自动在左右侧窗口切换  
  - t:       在新 Tab 中打开选中文件/书签，并跳到新 Tab  
  - T:       在新 Tab 中打开选中文件/书签，但不跳到新 Tab  
  - i:       split 一个新窗口打开选中文件，并跳到该窗口  
  - gi:      split 一个新窗口打开选中文件，但不跳到该窗口  
  - s:       vsplit 一个新窗口打开选中文件，并跳到该窗口  
  - gs:      vsplit 一个新 窗口打开选中文件，但不跳到该窗口  
  - gT:      前一个 tab  
  - gt:      后一个 tab  

4. tagbar快捷键:  
  - o:         打开/折叠标签  
  - \<space\>: 显示定义  

5. 查找/替换说明
  - 查找：在普通模式下，按'/'或'?'，然后输入要查找的字符，Enter
  - 替换：在普通模式下，按:%s/origin pattern/the pattern you want/g
      - 第一个词表示要替换的，第二个词表示要替换成的结果，/g表示全局替换
  - 默认区分大小写
      - :set ignorecase //忽略大小写，仅在当前vim生效，且重新打开失效
      - :set noignorecase //恢复到大小写敏感
  - '\\\>' 是一个特殊的记号，表示只匹配单词末尾。类似地，'\\\<' 只匹配单词的开头
      - /\\\<query\\\>     表示全词匹配query
      - :%s/query\\\>/querys/g     表示用querys替换词末尾的query

##### 如果vim状态栏出现乱码，请将let g:Powerline_symbols = 'fancy'中的'fancy'修改为'unicode'
##### 如果vim状态栏出现乱码，请将let g:Powerline_symbols = 'fancy'中的'fancy'修改为'unicode'
##### 如果vim状态栏出现乱码，请将let g:Powerline_symbols = 'fancy'中的'fancy'修改为'unicode'
