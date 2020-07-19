autocmd FileType python call SetLangPython()
function SetLangPython()

	set shiftwidth=2 tabstop=2 expandtab
	set textwidth=80
	let g:syntastic_python_python_exec = 'python3'
	let g:syntastic_python_checkers = ['python']
	let s:python_version = 'python3'

	nnoremap <silent> <buffer> <C-P> :call TogglePythonVersion() <CR>

endfunction

function TogglePythonVersion()
	if s:python_version ==? 'python3'
		call SetLangPython2()
	else
		call SetLangPython3()
	endif
	SyntasticCheck
	echo s:python_version
endfunction

function SetLangPython2()
	let g:syntastic_python_python_exec = 'python2'
	let s:python_version = 'python2'
endfunction

function SetLangPython3()
	let g:syntastic_python_python_exec = 'python3'
	let s:python_version = 'python3'
endfunction
