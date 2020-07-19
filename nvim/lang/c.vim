autocmd FileType c call SetLangC()
function SetLangC()

	set shiftwidth=4 tabstop=4 noexpandtab
	set textwidth=80

	let g:syntastic_c_compiler = 'gcc'
	let g:syntastic_c_compiler_options = '-std=c99 -Wall -pedantic'
	let g:syntastic_c_include_dirs = ['inc', 'include', 'config', '.']
	nnoremap <silent> <C-x> :!gcc % -o tmp ; ./tmp ; rm tmp<CR>

endfunction

