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

### 1. 常用快捷键
  - F2:  nerdtree，文件目录关闭打开
  - F3:  tagbar，大纲式导航，包括类、函数、变量
  - F4:  主题色彩切换
  - F5:  运行文件
  - F6:  从剪贴板黏贴时不会缩进异常，复制完后需要再按一次，否则可能导致插件异常
  - F7:  静态代码检查
  - Tab:  代码补全
  - \<leader\>cc, cu:  多行注释, 取消注释
  - \<space\>:  代码折叠
  - \<leader\>g:  跳转到定义处
  - Ctrl + o:  从定义处返回, 可以理解为后退
  - Ctrl + i:  前进，和Ctrl + o相反
  - Ctrl + p:  项目文件查找
  - :Autopep8:  采用pep8格式化代码

### 2. CtrlSF使用方式:  
  - f: 全局字符搜索，输入要搜索的字符后，按\<tab\>可以指定搜索的路径，不指定默认为当前目录  
  - p:在查询的结果中，表示在预览窗口打开该文件，查询结果页不关闭  
  - Enter:跳转到该行，查询结果页自动关闭  

### 3. NERDTree的快捷键:  
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

### 4. tagbar快捷键:  
  - o:         打开/折叠标签  
  - \<space\>: 显示定义  

### 5. 查找/替换说明
  - 查找：在普通模式下，按'/'或'?'，然后输入要查找的字符，Enter
      - '/'表示向下搜索。在第一次搜索之后输入n表示继续向下，N表示反方向
      - 另一种区分大小写，'\\c'表示忽略大小写, '\\C'表示区分大小写，比如：'/\\cword'
  - 替换：在普通模式下，按:s/origin pattern/the pattern you want/g
      - 第一个词表示要替换的，第二个词表示要替换成的结果，/g表示当前行内所有替换，如果没有/g就表示替换行内第一个
      - :m,ns/origin pattern/the pattern you want/g 表示替换从m到n行的每一行的所有
          - % 表示全部行 :%s/a/b/g
          - $ 表示最后一行 :10,$s/a/b
          - . 表示当前行
          - 也可以直接用数字
      - 可以用'#'代替'/'，这样单词中的'/'也可以被处理
  - 默认区分大小写
      - :set ignorecase //忽略大小写，仅在当前vim生效，且重新打开失效
      - :set noignorecase //恢复到大小写敏感
  - '\\\>' 是一个特殊的记号，表示只匹配单词末尾。类似地，'\\\<' 只匹配单词的开头
      - /\\\<query\\\>     表示全词匹配query
      - :%s/query\\\>/querys/g     表示用querys替换词末尾的query
  - 可使用正则, '.'表示任意**一个**字符，'\*'表示前面的重复0次或多次
  - 每行插入2个空格：`:%s/^/>  /` ,也可以先选择，然后输入'\>'

## 其他

### 关于编码
- Vim 启动，根据 .vimrc 中设置的 encoding 的值来设置 buffer、菜单文本、消息文的字符编码方式。
- 读取需要编辑的文件，根据 fileencodings 中列出的字符编码方式逐一探测该文件编码方式。并设置 fileencoding 为探测到看起来是正确的 字符编码方式,如果没有找到合适的编码，就用latin-1(ASCII)编码打开。
- 对比 fileencoding 和 encoding 的值，若不同则调用 iconv 将文件内容转换为 encoding 所描述的字符编码方式，并且把转换后的内容放到为此文件开辟的 buffer 里。
- 将encoding的编码转成termencoding的编码，并显示，如果termencoding的编码值和当前终端的设置值一直，那么显示正常，此时我们就可以开始编辑这个文件了
- 编辑完成后保存文件时，再次对比 fileencoding 和 encoding 的值。若不同，再次调用 iconv 将即将保存的 buffer 中的文本转换为 fileencoding 所描述的字符编码方式，并保存到指定的文件中。

### 关于flake8格式检查  
复制当前目录的`flake8`到`~/.config/`中即可自定义配置


##### 如果vim状态栏出现乱码，请将let g:Powerline_symbols = 'fancy'中的'fancy'修改为'unicode'
##### 如果vim状态栏出现乱码，请将let g:Powerline_symbols = 'fancy'中的'fancy'修改为'unicode'
##### 如果vim状态栏出现乱码，请将let g:Powerline_symbols = 'fancy'中的'fancy'修改为'unicode'
