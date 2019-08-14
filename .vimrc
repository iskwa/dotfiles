"###############################################################################
" VIM Resource file by H.Ishikawa
"===============================================================================
"-------------------------------------------------------------------------------
" base configuration
"-------------------------------------------------------------------------------
set nocompatible
scriptencoding cp932
syntax on
"-------------------------------------------------------------------------------
" System Settings
"-------------------------------------------------------------------------------
set runtimepath^=~/.vim
set history=100
set backspace=indent,eol,start
" next 2 lines does not work well..
" set visualbell
" set t_vb=
"-------------------------------------------------------------------------------
" Search Function Settings
"-------------------------------------------------------------------------------
set ignorecase
"-------------------------------------------------------------------------------
" Display Settings
"-------------------------------------------------------------------------------
set list
set listchars=tab:>\ ,eol:\ ,trail:-
set cursorline
highlight CursorLine cterm=none ctermbg=236

set wildmenu
set fileencodings=utf-8,cp932,iso-2022-jp,euc-jp
set fileformats=dos,unix,mac
"set nowritebackup
"set nobackup
set backupdir=~/.vim/backup
"set noundofile
set undofile
set undodir=~/.vim/undo
set number
set ruler
"set nowrap
set autoindent
set tabstop=4
set shiftwidth=4
set textwidth=0
"status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
" For Kaoriya Edition
autocmd FileType text setlocal textwidth=0
autocmd BufNewFile,BufRead *.md set filetype=markdown

"-------------------------------------------------------------------------------
" cscope configuration
"-------------------------------------------------------------------------------
if has("cscope")
  set csto=0
  " set cscopetag
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set nocscopeverbose
  " add any database in current directory
  if filereadable("cscope.out")
      cscope add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cscope add $CSCOPE_DB
  endif
  set cscopeverbose
endif

"-------------------------------------------------------------------------------
" key bindings
"-------------------------------------------------------------------------------
" make C-p and C-n scroll with filter in command line mode.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" import from y-shimizu, 
noremap <C-\>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
noremap <C-\>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>
noremap <C-\>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
noremap <C-\>d :cscope find d <C-R>=expand("<cword>")<CR><CR>
noremap <C-Space>s :scscope find s <C-R>=expand("<cword>")<CR><CR>
noremap <C-Space>g :scscope find g <C-R>=expand("<cword>")<CR><CR>
noremap <C-Space>c :scscope find c <C-R>=expand("<cword>")<CR><CR>
noremap <C-Space>t :scscope find t <C-R>=expand("<cword>")<CR><CR>
noremap <C-Space>e :scscope find e <C-R>=expand("<cword>")<CR><CR>
noremap <C-Space>f :scscope find f <C-R>=expand("<cfile>")<CR><CR>
noremap <C-Space>i :scscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
noremap <C-Space>d :scscope find d <C-R>=expand("<cword>")<CR><CR>

"-------------------------------------------------------------------------------
" Plugins management
"-------------------------------------------------------------------------------
filetype off

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  " set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
"call neobundle#begin(expand('~/vimfiles/bundle/'))
"let g:neobundle_default_git_protocol='https'
"let g:neobundle#types#git#default_protocol='https'

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" Recommended to install
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-quickrun'
" vim-scripts repos
NeoBundle 'bufferlist.vim'
" NeoBundle 'taglist.vim'
NeoBundle 'majutsushi/tagbar'
" NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'dag/vim2hs'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"-------------------------------------------------------------------------------
" neocomplete.vim
"-------------------------------------------------------------------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

