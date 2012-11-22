" print an ascii cat on startup --just for fun 
echo "(>^.^<)"

"common settings--------------------{{{
set number
set autoindent
set tabstop=4
set shiftwidth=4	" number of spaces to autoindent
set showcmd			" display incomplete commands
set ruler			" show cursor position all the time
set laststatus=2	" always show status line
set foldlevelstart=0
" }}}

"Movement mappings--------------------{{{
"faster way to get back to normal mode from insert mode
inoremap jk <esc>

" add a mapping to ddp, to move lines down a file using -, and 
" move them up a file using _
nnoremap <leader>- ddp
nnoremap <leader>_ ddk<s-p>
" move around 3 lines at a time
"nnoremap <space> 3j
"nnoremap <M><Space> 3k
nnoremap <space> 3j
" }}}

" Mappings for Words--------------------{{{

" select a word
" Doesn't work because <space> 
" is remapped further down
nnoremap <space> viw
" mappings to turn word into uppercase in insert and normal mode
inoremap <leader><c-u> <esc>viwUi
nnoremap <leader><c-u> viwU
"adding quotes to word under cursor
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"adding quotes around a visual mode area
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
" }}}


" map leader setting
let mapleader = "\\"
"let maplocalleader = "\\"

" editing and sourcing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"abbreviations for my name and email
iabbrev @a Armando Diaz Tolentino <armando_diaz@lavabit.com>
" making a section heading for notes
nnoremap <leader>h o<esc>20i~<esc>o<cr><esc>20i~<esc>ki
" search for currently selected text
vnoremap <leader>s y/<C-R>"<C-R>



" shadow arrow keys--------------------{{{
"mappings to shadow out arrow keys in normal mode
inoremap <esc> <nop>
nnoremap <right> <nop> 
nnoremap <left> <nop> 
nnoremap <up> <nop> 
nnoremap <down> <nop> 
inoremap <right> <nop> 
inoremap <left> <nop> 
inoremap <up> <nop> 
inoremap <down> <nop> 
" }}}


"file specific autocommands -------------------{{{-
"autocmds for commenting
augroup commenting
autocmd!
autocmd FileType java nnoremap <buffer> <localleader>c I//
autocmd FileType java set nowrap
autocmd FileType python nnoremap <buffer> <localleader>c I#
augroup END

" test autocommands remove later
augroup ifcommands
autocmd!
autocmd FileType javascript :iabbrev <buffer> iff if ( ) {}<left><left><left><left><left> 
autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

" autocmmands specific to latex, remove later
augroup latex
autocmd!
autocmd FileType tex :iabbrev <buffer> ... \cdots
augroup END
" }}}

"OPERATOR-PENDING MAPPINGS--------------------{{{
" text inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
" text inside prev parentheses
onoremap il( :<c-u>normal! F)vi(<cr>
" text around next parentheses
onoremap an( :<c-u>normal! f(va(<cr>
" text inside prev parentheses
onoremap al( :<c-u>normal! F)va(<cr>

" BRACES
" text inside next braces
onoremap in{ :<c-u>normal! f{vi{<cr>
" text inside prev braces
onoremap il{ :<c-u>normal! F}vi{<cr>
" text around next braces
onoremap an{ :<c-u>normal! f{va{<cr>
" text around prev braces
onoremap al{ :<c-u>normal! F}va{<cr>

" change inside email address
onoremap in@ :<c-u>normal! f@hviw<cr>

" }}}


" Markdown movements--------------------{{{
"markdown movements --remove later
"Dont understand why these don't work???
"reg expr isn't found?
augroup markdown
autocmd!
autocmd FileType markdown :onoremap <buffer>ih :<c-u>execute ":normal! ?^==\\+$\\|^--\\+$\r:nohlsearch\rkvg_"<cr>
autocmd FileType markdown :onoremap <buffer> ah :<c-u>execute ":normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

"Statusline settings -------------------------------- {{{
set statusline=%f			"relative path and filename
set statusline+=\ -\ 		"separator
set statusline +=FileType:%y	"Label and Filetype
set statusline +=%=			" switch to right side
set statusline +=[%5l/		" Current line
set statusline +=%5L]		" Total lines
" }}}

"vimscript file settings -----------------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim nnoremap <buffer> <leader>h i"<esc>20i-<esc>3i{<esc>o"<esc>3i}<esc>k0a
augroup END
" }}}
