" maping only open tex buffer
let g:FileExtention=expand('%:p:e')
fun TexRun()
	if g:FileExtention ==? 'tex'
		term pdflatex %:p
		fun OpenFile()
			term zathura %:p:t:r.pdf 
		endfun
		nnoremap <leader>r :call OpenFile()<cr>
	endif
endfun

fun JsRun()
    if g:FileExtention ==? 'js'
        term node %:p
    endif
endfun

fun PyRun()
    if g:FileExtention ==? 'py'
        term python3 %:p
    endif
endfun
fun RunCode()
	call TexRun()
    call JsRun()
    call PyRun()
endfun

nnoremap <buffer> <leader>c :call RunCode()<cr>
