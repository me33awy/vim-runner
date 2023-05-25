let g:FileExtention=expand('%:p:e')

fun TexRun()
	if g:FileExtention ==? 'tex'
		cd %:p:h
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

if g:FileExtention ==? 'tex' || g:FileExtention ==? 'md'
	nnoremap <leader>r :call OpenFile()<cr>
en

fun JsRun()
	if g:FileExtention ==? 'js'
		cd %:p:h
		term node %:p
	en
endf

fun PyRun()
	if g:FileExtention ==? 'py'
		cd %:p:h
		term python3 %:p
	en
endf

fun MdRun()
	if g:FileExtention ==? "md"
		cd %:p:h
		let answer = confirm('view or convert', "&grip\n&pandoc")
		if answer == 1
			term grip -b  %:p
		elseif answer == 2
			exec 'silent !pandoc %:p -o %:p:t:r.pdf'
			redraw!
		en
	endif
endf

fun RunCode()
	echo g:FileExtention
	w
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
