let g:tex_flavor = "latex"
autocmd FileType tex call SetLangTex()

function SetLangTex()

	set shiftwidth=2 tabstop=2 expandtab
	set textwidth=80

	let g:syntastic_tex_checkers = []

	nnoremap <silent> <buffer> <A-b> :call CompileLatex() <CR>
	nnoremap <silent> <buffer> <A-o> :!open %:p:h:h/bin/%:t:r.pdf <CR>
	nnoremap <Esc>m :call RepMath() <CR>

endfunction

function RepMath()
	:%s/ \* / $\\cdot$ /gc
	:%s/ \/ / $\\div$ /gc
endfunction

function CompileLatex()
	!pdflatex -output-directory %:p:h:h/aux %:p
	!mv %:p:h:h/aux/%:t:r.pdf %:p:h:h/bin/%:t:r.pdf
endfunction
