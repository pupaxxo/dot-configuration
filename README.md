# Andrea Ruggiero . configuration

## Installed plugins

### Vim
* Vundle 
* COC autocomplete (or supertab on vim)
* nerdtree (with git support)
* vim-airline 
* tagbar
* fzf
* vim-workspaces
* php-cs-fixer plugin
* prettier-plugin
* vim-fugitive

### Tmux
* Powerline support

## How to install

Run the following bash snippet

```bash

# Install needed packages on Linux
if uname | grep -q Linux; then
  sudo apt install fish tmux curl nodejs powerline
fi

# Install needed packages on macOS
if uname | grep -q Darwin; then
  brew install python3 reattach-to-user-namespace; pip3 install powerline-status powerline-mem-segment
fi

# Install needed configurations
ln -s $(pwd)/nvim-configuration ~/.config/nvim
ln -s $(pwd)/powerline-configuration ~/.config/powerline
ln -s $(pwd)/fish-configuration ~/.config/fish
ln -s $(pwd)/omf-configuration ~/.config/omf
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/vimrc ~/.vimrc

# Install fish
curl -L https://get.oh-my.fish | fish

```

### Additional steps if you plan to use nvim

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

## Shortcuts

### Vim
* *Ctrl-n* : open file tree
* *Ctrl-t* : open tags panel
* *n* : open new tab
* *|* : split verically
* *-* : split horizontally
* *o* : run prettier
* *l* : run php-cs-fixer
* *Ctrl-f* : fuzzy search
* *Ctrl-p* : git push
* *Ctrl-s* : interactive git status
* *Ctrl-c* : git commit

### Tmux
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
