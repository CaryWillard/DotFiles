" Pathogen
execute pathogen#infect()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1

" Rust
let g:syntastic_rust_checkers = ['rustc']
"let g:rustfmt_autosave = 1

" C++
let g:syntastic_cpp_include_dirs = ['/usr/local/boost_1_62_0/']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'

" Python3
let g:syntastic_python_python_exec = '/usr/bin/python3'

" Vim Autoformat on save
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Line numbers
set nu

" Tab characters
set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4
set smarttab
set autoindent

" Filetype specific features


fu CloseChar(open, close)
	inoremap open, open close<Left>
endfu

fu InsertClosingChars()
	inoremap ( ()<Left>
	inoremap < <><Left>
	inoremap " ""<Left>
	inoremap ' ''<Left>
	inoremap [ []<Left>
	inoremap { {}<Left>
	inoremap (<Space> (<Space><Space>)<Left><Left>
	inoremap <<Space> <<Space><Space>><Left><Left>
	inoremap [<Space> [<Space><Space>]<Left><Left>
	inoremap {<Space> {<Space><Space>}<Left><Left>
	inoremap <C-K> <C-O>%<C-O>%<right>
endfu

" Curly braces open on separate lines
fu CurlyBracesCs()
	inoremap {<CR> <Space><CR>{<CR><Tab><CR><Bs>}<Up><Right>
endfu

" Curly braces open with the first brace on the same line.
fu CurlyBracesJava()
	inoremap {<CR> <Space>{<CR><Tab><CR><Bs>}<Up><Right>
endfu

fu CppSettings()
	:call InsertClosingChars()
	:call CurlyBracesCs()
endfu

fu RsSettings()
	:call InsertClosingChars()
	:call CurlyBracesJava()
endfu

fu PySettings()
	:call InsertClosingChars()
	" After colon, indent to new scope
	inoremap : :<CR><Tab>
endfu

" Call a function to set specific settings
au BufNewFile,BufRead *.c :call CppSettings()
au BufNewFile,BufRead *.h :call CppSettings()
au BufNewFile,BufRead *.cpp :call CppSettings()
au BufNewFile,BufRead *.cs :call CppSettings()
au BufNewFile,BufRead *.rs :call RsSettings()
au BufNewFile,BufRead *.java :call RsSettings()
au BufNewFile,BufRead *.py :call PySettings()

" Enable filetype recognition
filetype on
