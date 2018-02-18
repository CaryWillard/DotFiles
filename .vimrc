" .vimrc

" Pathogen
execute pathogen#infect()

" Standard vim stuff
filetype plugin indent on
syntax on
set nu
set rnu
set hlsearch

" Tab characters
set tabstop=4
set softtabstop=0
set expandtab " Make tabs into spaces
set shiftwidth=4
set smarttab
set autoindent

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" DelimiteMate
let g:delimitMate_expand_cr = 2
let g:delimitMate_smart_quotes = 1

" Rust
let g:syntastic_rust_checkers = ['cargo']
let g:rustfmt_autosave = 1

" Rust - delimitMate
au FileType rust let b:delimitMate_quotes = "\""

" Rust - vim-racer
set hidden
let g:racer_cmd = "/home/cary/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

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

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Evaluate Clojure buffers on load - for vim-clojure-highlight
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
au FileType clojure let b:delimitMate_quotes = "\""
au FileType clojure let g:delimitMate_expand_cr = 0

