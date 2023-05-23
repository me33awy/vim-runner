let g:FileExtention=expand('%:p:e')

fun TexRun()
	if g:FileExtention ==? 'tex'
		cd %:p:h
		w
		set makeprg=pdflatex\ -synctex=1\ -interaction=nonstopmode\ %:p
		silent make
		cd -
		cbottom
		redraw!
	en
endf
fun g:OpenFile()
	cd %:p:h
	let option1 = '--synctex-forward '
	let option2 = line('.') .. ":" .. col('.') .. ":" .. "%:p"
	exec "silent !zathura %:p:t:r.pdf " .. option1 .. option2 .. '& disown'
	redraw!
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

fun MdRun()
	if g:FileExtention ==? "md"
		term grip -b %:p
	endif
endf

fun RunCode()
	let language = ['js', 'py', 'tex', 'md']
	for ext in language
		if ext ==? 'js'
			cal JsRun()
		elseif ext ==? 'tex'
			cal TexRun()
		elseif ext ==? 'py'
			cal PyRun()
		elseif ext ==? 'md'
			cal MdRun()
		else
			echo "Not Supported Language"
		endif
	endfor
endf	

nnoremap <leader>c :call RunCode()<cr>
