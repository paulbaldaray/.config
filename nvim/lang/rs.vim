autocmd FileType rust call SetLangRust()
function SetLangRust()

	set shiftwidth=4 tabstop=4 expandtab
	set textwidth=80

	nnoremap <silent> <buffer> <C-B> :!cargo build <CR>
	nnoremap <silent> <buffer> <C-X> :!cargo run <CR>

endfunction
