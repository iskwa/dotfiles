"#######################################
" GVIM Resource file by H.Ishikawa
"#######################################
colorscheme molokai_mod
set guifont=Migu_1M:h9
set guioptions-=T
set guioptions-=m
autocmd FocusGained * set transparency=250
autocmd FocusLost * set transparency=240

" Change cursor color when IME is ON
if has('multi_byte_ime') || has('xim')
	highlight CursorIM guibg=Orange guifg=NONE
endif
