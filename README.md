# Andrea (Neo) vim configuration

## How to use

* Link all the files in this directory to your `$HOME` (of coure not README.md)
* You'll need Vundle, check below how to install vundle
* Now install required plugins: execute `vim +PluginInstall +qall`

### Additional steps if you plan to use nvim

* Open vim and run `:call coc#util#install()`
* For PHP support run `:CocInstall coc-phpls`
* For JS and TS support run `:CocInstall coc-phpls`

### How to install Vundle

Run this command:

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Shortcuts
* *Ctrl-n* : open file tree
* *Ctrl-h* : split vertically
* *Ctrl-s* : split horizontally
