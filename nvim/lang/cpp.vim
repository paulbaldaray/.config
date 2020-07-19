autocmd FileType cpp call SetLangCPP()
function SetLangCPP()

	set shiftwidth=2 tabstop=2 noexpandtab
	set textwidth=80

	let g:syntastic_cpp_compiler = 'g++'
	let g:syntastic_cpp_compiler_options = ' -std=c++11'

endfunction
