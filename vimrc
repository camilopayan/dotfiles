call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'airblade/vim-gitgutter'
" Plug 'raimondi/delimitmate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'vim-vdebug/vdebug'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-dadbod'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-rails'

call plug#end()

" Airline
set t_Co=256
let g:airline_theme='luna'

" Syntax and tabbing
set expandtab
au Filetype * set ts=2 sts=2 sw=2 number
au FileType python set ts=4 sts=4 sw=4 nosmartindent number
au FileType ruby set ts=2 sts=2 sw=2 nosmartindent number
au FileType php set ts=4 sts=4 sw=4 number
au FileType html set ts=2 sts=2 sw=2 number
au FileType javscript set ts=2 sts=2 sw=2 number
au FileType xhtml set ts=2 sts=2 sw=2 number
au FileType css set ts=2 sts=2 sw=2 number
au FileType sh set ts=2 sts=2 sw=2 nosmartindent number
au FileType xml set ts=2 sts=2 sw=2 number

" copy and paste to clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
  endif
endif

" Keyboard shortcuts
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tq :tabclose<CR>

" Plugin Specific Settings

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" UltiSnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:deoplete#enable_at_startup = 1

" ctrlP
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
set wildignore+=*/.git/*,*/tmp/*,*.swp

" ale
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '💩'
let g:ale_fix_on_save = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_fixers={
  \'php': ['prettier'],
  \'ruby': ['prettier'],
\}

" polyglot
let g:polyglot_disabled = ['liquid']

" tell vim to keep a backup file in another directory
set backup
set backupdir=/private/tmp
set dir=/private/tmp

" set encoding for vim devicons
set encoding=UTF-8

" Solves a problem with netrw
autocmd FileType netrw setl bufhidden=delete

" Configuring Ack.vim
let g:ackprg = 'rg --vimgrep --no-heading'

set secure

au FileType blade.php set filetype=html.php

set background=light
colorscheme solarized8_high

function! Scratch()
    tabnew
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction

nnoremap <Leader>ts :call Scratch()<CR>
