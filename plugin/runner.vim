let g:FileExtention=expand('%:p:e')

fun TexRun()
	if g:FileExtention ==? 'tex'
		cd %:p:h
		w
		silent !pdflatex %:p
		cd -
		redraw!
	else
		echo 'Not Supporting Language Yet'
	en
endf
fun g:OpenFile()
	cd %:p:h
	silent !zathura %:p:t:r.pdf & disown
	cd -
endf

if g:FileExtention ==? 'tex'
	nnoremap <leader>r :call OpenFile()<cr>
en

fun JsRun()
	if g:FileExtention ==? 'js'
		term node %:p
	en
endf

fun PyRun()
	if g:FileExtention ==? 'py'
		term python3 %:p
	en
endf
fun RunCode()
	call TexRun()
	call JsRun()
	call PyRun()
endf	

nnoremap <buffer> <leader>c :call RunCode()<cr>
