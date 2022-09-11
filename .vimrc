" vim: set ts=2 sts=2 sw=2 et:

execute pathogen#infect()

set nocompatible
set ttimeoutlen=10
set noerrorbells
set listchars=tab:>\-,nbsp:.,extends:#,trail:\!
set nowrap
let &showbreak="> "
set ignorecase
" This is off by default in current Arch and in Centos7 according to docs
" but unexpectedly it is actually on on Centos7. Let's set it to no explicitly.
set nohlsearch
" supertab is currently does not work with smartcase
" set smartcase
set ruler
if exists('+undofile')
  set undofile
endif
set diffopt=filler,vertical
" centos7 version does not support closeoff
silent! set diffopt+=closeoff
set imsearch=-1
set keymap=russian-colemakwin
set iminsert=0
set encoding=utf-8
set fileformat=unix
set completeopt=menu,preview,longest
set wildmode=longest,list
set wildignorecase
set hidden
set gdefault
set formatoptions=qr1
set showcmd

syntax on
filetype plugin indent on
colorscheme wombat256

" stopped here

" keymappings
" ===========

" colemak motions
map j <Left>
map l <Right>
map h <Up>
map k <Down>

" colemak motions when moving between windows
nmap <C-j> <C-W><Left>
nmap <C-l> <C-W><Right>
nmap <C-h> <C-W><Up>
nmap <C-k> <C-W><Down>

" colemak motions when moving windows
nnoremap <C-W>J <C-W>H
nnoremap <C-W>L <C-W>L
nnoremap <C-W>H <C-W>K
nnoremap <C-W>K <C-W>J

" some mappings that more useful then defaults

" find match of brakets etc with Tab
nnoremap <tab> %
vnoremap <tab> %

" fast leader mappings
" ====================

" set leader eary or it could be the source of wtf

" I guess , main usage is to go back if you pressed ; extra times. Well
" one can just use revert motion f<->F for this purpuse. I guess ; isn't
" over pressed regularly.
let mapleader=","

nmap <leader>/ :setlocal hlsearch!<CR>
nmap <leader>l :setlocal list! list?<CR>
nmap <leader>p :setlocal paste! paste?<CR>

" r for recent
nnoremap <leader>r :BufExplorer<CR>
" o for open
nnoremap <leader>o :NERDTreeToggle<CR>
" b for blame
nnoremap <leader>b :Git blame<CR>

" slower leader mappings
" ======================

" strip trailing whitespaces
nnoremap <leader><leader>s :%s/\s\+$//<CR>:let @/=''<CR>

" tune plugins settings
" =====================

" easymotion
let g:EasyMotion_leader_key='<leader>'
let g:EasyMotion_mapping_j='<leader>k'
let g:EasyMotion_mapping_k='<leader>h'

" supertab
let g:SuperTabDefaultCompletionType="<c-n>"
let g:SuperTabLongestEnhanced=1

" nerdtree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" bufexplorer
let g:bufExplorerShowRelativePath=1

" more enhanced tunings
" =====================

" set color column but not for help
if exists('+colorcolumn')
  augroup color-column
    autocmd!
    autocmd FileType * setlocal colorcolumn=80
    autocmd FileType help,bufexplorer,nerdtree setlocal colorcolumn=0
  augroup END
endif

if filereadable(".lvimrc")
  so .lvimrc
endif
