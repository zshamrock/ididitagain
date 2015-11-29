execute pathogen#infect()
filetype plugin indent on

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

set ts=4
set expandtab
set ruler
set cursorline
"set nocompatible
"set bs=indent,eol,start

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

set number
set hlsearch
syntax on

set smartcase
"set autoindent

set spl=en spell
autocmd BufRead,BufNewFile *.gradle setlocal nospell

map <F8> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
map <F7> :setlocal nospell<CR>


"set clipboard=unnamedstar

if has('gui_running')
    let b:fontame = "Droid Sans Mono"
    let b:fontsize = 10 

    let &guifont = b:fontame . "\ " . string(b:fontsize)

    set background=dark
    colorscheme Tomorrow-Night
else
    "let g:solarized_termcolors=256
    set background=dark
    colorscheme torte
    "colorscheme solarized
    "colorscheme default
endif


" work with tabs
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>
map ,t :tabnew<CR>
map <M-Right> :tabn<CR>
map <M-Left> :tabp<CR>

" for taglist
map <M-F12> :TlistToggle<CR>

"colorscheme solarized

"practical vim
nnoremap <C-l> :<C-u>nohlsearch<CR><C-l> 
set incsearch

" paredit config
let g:paredit_smartjump=1

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
au FileType perl call PareditInitBuffer()

" disable arrows, and remind about keys usage
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" interesting config file
" https://github.com/mscoutermarsh/dotfiles/blob/master/vimrc

set wildmode=longest,list,full
set wildmenu

" experimental
set clipboard=unnamedplus
