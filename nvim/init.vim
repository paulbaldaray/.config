call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
call plug#end()

set backspace=1
set laststatus=0
set number relativenumber
set shiftwidth=2 tabstop=2 noexpandtab
set autoindent smarttab
set nohlsearch incsearch ignorecase smartcase
set list listchars=trail:_,tab:›\ 

syntax on
colorscheme gruvbox
set background=dark
highlight MatchParen ctermbg=blue
highlight Normal ctermbg=None
autocmd VimEnter * ColorHighlight

function! SourceDirectory(file)
	for s:fpath in split(globpath(a:file, '*.vim'), '\n')
		exe 'source' s:fpath
	endfor
endfunction

let g:syntastic_check_on_open = 1
call SourceDirectory("~/.config/nvim/lang")

" Terminal Settings
map <silent> <C-t> :terminal<CR>
autocmd TermOpen * setlocal nonumber norelativenumber modifiable
tnoremap <Esc> <C-\><C-n>

" Tab Bindings
noremap <silent> <A-t> :tabedit<CR>
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt

" Split Bindings
noremap <silent> <A-s> :vsplit<CR>
noremap <silent> <A-S> :split<CR>
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l

" Misc Bindings
noremap <silent> <A-c> :ColorToggle<CR>
noremap <silent> <A-q> :q<CR>
map <silent> <A-e> :Explore<CR>
map <silent> <A-v> :set number! relativenumber! list! paste!<CR>
