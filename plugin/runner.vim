function Run()
	let filetype = &filetype
	if filetype == 'javascript'
		:term node %:p
	else 
		echo 'Sorry this plugin is for js files'
	endif
endfunction

map <leader>r :call Run()<cr>
