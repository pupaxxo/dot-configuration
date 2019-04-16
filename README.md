# Andrea Ruggiero . configuration

## Installed plugins

### Vim
* Vundle 
* COC autocomplete (or supertab on vim)
* nerdtree (with git support)
* vim-airline 
* tagbar

## Tmux
* Powerline support

## How to install

* Run `brew install python3 reattach-to-user-namespace; pip3 install powerline-status powerline-mem-segment`
* Run `ln -s $(pwd)/nvim-configuration ~/.config/nvim`
* Run `ln -s $(pwd)/powerline-configuration ~/.config/powerline`
* Run `ln -s $(pwd)/tmux.conf ~/.tmux.conf`
* Run `ln -s $(pwd)/vimrc ~/.vimrc`
* You'll need Vundle, check below how to install vundle
* Now install required plugins, run `vim +PluginInstall +qall`

### Additional steps if you plan to use nvim

* Open nvim and run `:call coc#util#install()`
* Run `ln -s $(which nvim) /usr/local/bin/vim`

### Language auto-complete services

* For PHP support run `:CocInstall coc-phpls`
* For JS and TS support run `:CocInstall coc-phpls`
* For JSON support run `:CocInstall coc-json`
* For HTML support run `:CocInstall coc-html`
* For CSS support run `:CocInstall coc-css`
* For Java support run `:CocInstall coc-java`
* For YAML support run `:CocInstall coc-yaml`
* For Python support run `:CocInstall coc-python`

### How to install Vundle

Run this command:

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Shortcuts

### Vim
* *Ctrl-n* : open file tree
* *Ctrl-t* : open tags panel
* *n* : open new tab
* *|* : split verically
* *-* : split horizontally

### Tmux
* *Ctrl-z* : toggle zoom (default on tmux)
* *"* or *|* : split vertically
* *%* or *-* : split horizontally
* *E* : enable synchronized panes
* *e* : disable synchronize-panes
* *h* : move panel
* *j* : move down
* *k* : move up
* *k* : move right
* *>* : swap pane (next)
* *<* : swap pane (prev)
* *r* : reload configuration
