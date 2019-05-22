" Automatically install vim-plug (if needed)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup vim-plug
call plug#begin('~/.vim/plugged')

set termguicolors

" General settings
set nocompatible
set number
syntax on
set ignorecase
set smartcase
set mouse=a
set title
set background=dark
set hlsearch
set incsearch
" hi  Search ctermfg=black ctermbg=brown
set expandtab
set tabstop=2
set shiftwidth=2
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
set lazyredraw
set ruler
" colorscheme slate
" Split (- and |)
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
" Quit, Close, Write
map q     :q<CR>
map c     :bd<CR>
map w     :w<CR>
" Tab and Shift-Tab 
nnoremap <S-Tab> <<
vnoremap <S-Tab> <
inoremap <S-Tab> <C-d>
nnoremap <Tab> >>
vnoremap <Tab> >
inoremap <S-Tab> <C-t>

" Fzf (improved fuzzy search)"
Plug 'junegunn/fzf'
map <C-f> :FZF<CR>

" SpamAssasins syntax highlight
Plug 'vim-scripts/SpamAssassin-syntax'
autocmd BufNewFile,BufRead *.cf setlocal filetype=spamassassin

" Yara syntax highlight
Plug 's3rvac/vim-syntax-yara'
autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara

" Syntax checker
Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_aggregate_errors = 1

" vim proc
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Typescript
" Plug 'Quramy/tsuquyomi'
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

" Autocomplete
if has('nvim')
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
    
    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    vmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    vmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)


    " Add diagnostic info for https://github.com/itchyny/lightline.vim
    let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'cocstatus': 'coc#status'
          \ },
          \ }



    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
else
    Plug 'ervandew/supertab'
endif

" Git support
Plug 'tpope/vim-fugitive'
map <C-s> :Gstatus<CR>
map <C-c> :Gcommit %<CR>
map <C-p> :Git push<CR>
Plug 'airblade/vim-gitgutter'

" Indent lines
" let g:indent_guides_enable_on_vim_startup = 1
Plug 'nathanaelkane/vim-indent-guides'

" Improved comments
Plug 'tpope/vim-commentary'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize = 50
let NERDTreeQuitOnOpen=1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
highlight! link NERDTreeFlags NERDTreeDir

" Improved status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline_skip_empty_sections = 1

" Prettier
Plug 'mitermayer/vim-prettier'
map o :Prettier<CR>

" PHP cs fixer
Plug 'stephpy/vim-php-cs-fixer'
map l :call PhpCsFixerFixFile()<CR>

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd BufWritePost *.tsx silent! :Prettier
autocmd BufWritePost *.ts silent! :Prettier
autocmd BufWritePost *.jsx silent! :Prettier
autocmd BufWritePost *.js silent! :Prettier
autocmd BufWritePost *.json silent! :Prettier

" Workspaces
Plug 'thaerkh/vim-workspace'
map <C-k> :ToggleWorkspace<CR>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir = $HOME . '/.vim/undodir'
let g:workspace_autosave = 0

" PHP syntax highlight
Plug 'StanAngeloff/php.vim'

" Typescript syntax highlight
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
autocmd BufRead,BufNewFile *.tsx,*.jsx setfiletype typescript.tsx
autocmd BufRead,BufNewFile *.ts setfiletype typescript

" Fish syntax highlight
Plug 'dag/vim-fish'
autocmd BufRead,BufNewFile *.fish setfiletype fish

" Twig syntax highlight
Plug 'nelsyeung/twig.vim'

" Color scheme
Plug 'joshdick/onedark.vim'
Plug 'isobit/vim-darcula-colors'
Plug 'chriskempson/base16-vim'

" End
call plug#end()

" Colors
" colorscheme darcula
let base16colorspace=256
colorscheme base16-classic-dark

" Blues
" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5

" dark blues
hi xmlEndTag guifg=#2974a1
hi jsxCloseString guifg=#2974a1
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi jsxAttrib guifg=#1BD1C1
