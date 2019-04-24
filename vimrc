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
map c     :bd<CR>
map w     :w<CR>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <
inoremap <S-Tab> <C-d>
nnoremap <Tab> >>
vnoremap <Tab> >
inoremap <S-Tab> <C-t>

" Fzf (improved fuzzy search"
Plugin 'junegunn/fzf'
map <C-f> :FZF<CR>

" Syntax checker
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }

" Autocomplete
if has('nvim')
    Plugin 'neoclide/coc.nvim'
    " Execute after coc.nvim install :call coc#util#install()
    
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
    Plugin 'ervandew/supertab'
endif

" Git support
Plugin 'tpope/vim-fugitive'
map <C-s> :Gstatus<CR>
map <C-c> :Gcommit %<CR>
map <C-p> :Git push<CR>

" Indent lines
" let g:indent_guides_enable_on_vim_startup = 1
Plugin 'nathanaelkane/vim-indent-guides'

" Improved comments
Plugin 'tpope/vim-commentary'

" File tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize = 50
let NERDTreeQuitOnOpen=1

" Improved status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

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

