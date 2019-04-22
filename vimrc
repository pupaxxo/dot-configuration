" Setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" General settings
set number
syntax on
set ignorecase
set smartcase
set mouse=a
set title
set background=dark
set hlsearch
set incsearch
hi  Search ctermfg=black ctermbg=brown
set expandtab
set tabstop=4
set shiftwidth=4
set showmode
set nu
set cursorline
set hidden
set backspace=indent,eol,start
set scrolloff=5
set signcolumn=yes
set updatetime=300
set shortmess+=c
set clipboard=unnamed
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
map n     :tabnew<CR>
map q     :q<CR>
map w     :w<CR>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Fzf (improved fuzzy search"
Plugin 'junegunn/fzf'
map <C-f> :FZF<CR>

" Autocomplete
if has('nvim')
    Plugin 'neoclide/coc.nvim'
    " Execute after coc.nvim install :call coc#util#install()
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if &filetype == 'vim'
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
else
    Plugin 'ervandew/supertab'
endif

" Git support
Plugin 'tpope/vim-fugitive'
map <C-s> :Gstatus<CR>
map <C-c> :Gcommit %<CR>
map <C-p> :Git push<CR>

" File tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize = 50
let NERDTreeQuitOnOpen=1

" Improved status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_theme='luna'

" Prettier
Plugin 'mitermayer/vim-prettier'
map o :Prettier<CR>

" PHP cs fixer
Plugin 'stephpy/vim-php-cs-fixer'
map l :call PhpCsFixerFixFile()<CR>

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd BufWritePost *.tsx silent! :Prettier
autocmd BufWritePost *.ts silent! :Prettier
autocmd BufWritePost *.jsx silent! :Prettier
autocmd BufWritePost *.js silent! :Prettier
autocmd BufWritePost *.json silent! :Prettier

" Workspaces
Plugin 'thaerkh/vim-workspace'
map <C-k> :ToggleWorkspace<CR>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir = $HOME . '/.vim/undodir'

" Improved syntax highlight
Plugin 'leafgarland/typescript-vim'
autocmd BufRead,BufNewFile *.tsx setfiletype typescript

" End
call vundle#end()
filetype plugin indent on

