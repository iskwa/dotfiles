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

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

"-------------------------------------------------------------------------------
" Plugins management
"-------------------------------------------------------------------------------
filetype off

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#end()
  call dein#save_state()
endif

if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
elseif has('lua')
"   call dein#add('Shougo/neocomplete', {
"   \   'depends' : ['neosnippet', 'context_filetype.vim'],
"   \   'on_i' : 1,
"   \})
endif

filetype plugin indent on

if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
endif

syntax enable

" " Note: Skip initialization for vim-tiny or vim-small.
" if 0 | endif
" if has('vim_starting')
"   if &compatible
"     set nocompatible               " Be iMproved
"   endif
" 
"   " Required:
"   set runtimepath+=~/.vim/bundle/neobundle.vim/
"   " set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
" endif
" 
" " Required:
" call neobundle#begin(expand('~/.vim/bundle/'))
" "call neobundle#begin(expand('~/vimfiles/bundle/'))
" "let g:neobundle_default_git_protocol='https'
" "let g:neobundle#types#git#default_protocol='https'
" 
" " Let NeoBundle manage NeoBundle
" " Required:
" NeoBundleFetch 'Shougo/neobundle.vim'
" 
" " My Bundles here:
" " Refer to |:NeoBundle-examples|.
" " Note: You don't set neobundle setting in .gvimrc!
" " Recommended to install
" NeoBundle 'Shougo/neocomplete.vim'
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimfiler.vim'
" NeoBundle 'Shougo/vimshell.vim'
" NeoBundle 'thinca/vim-visualstar'
" NeoBundle 'thinca/vim-quickrun'
" " vim-scripts repos
" NeoBundle 'bufferlist.vim'
" " NeoBundle 'taglist.vim'
" NeoBundle 'majutsushi/tagbar'
" " NeoBundle 'airblade/vim-gitgutter'
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'mattn/emmet-vim'
" NeoBundle 'Lokaltog/vim-easymotion'
" "NeoBundle 'dag/vim2hs'
" 
" call neobundle#end()
" 
" " Required:
" filetype plugin indent on
" 
" " If there are uninstalled bundles found on startup,
" " this will conveniently prompt you to install them.
" NeoBundleCheck
" 
" "-------------------------------------------------------------------------------
" " neocomplete.vim
" "-------------------------------------------------------------------------------
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

