" code for vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-fugitive'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'  " vim  snippets
Plugin 'vim-scripts/vim-addon-mw-utils' " required by vim-snipmate
Plugin 'tomtom/tlib_vim' " required by vim-snipmate
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}    " powerline needs to be in runtime path (why?)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"################################################################################ 
"                                   Non Vundle Stuff
"################################################################################ 
" tagbar plugin
nnoremap <leader><leader>c :TagbarToggle<cr>
" vim colorscheme
"syntax on
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" print an ascii cat on startup --just for fun 
echo "(>^.^<)"

" nerdtree settings--------------------{{{
augroup NERDTREE
autocmd!
"autocmd vimenter * NERDTree " displays nerd tree on enter
augroup END
nnoremap <leader>e :NERDTreeToggle<CR>
" }}}
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

"reload all snipmate snippets
nnoremap <leader>ss :call ReloadAllSnippets()<cr>

" map leader setting
let mapleader = "\\"
"let maplocalleader = "\\"

" editing and sourcing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"abbreviations for my name and email
iabbrev @a Armando Diaz Tolentino <ajdt@cs.washington.edu>
" making a section heading for notes
nnoremap <leader>h o<esc>20i~<esc>o<cr><esc>20i~<esc>ki
" search for currently selected text
vnoremap <leader>s y/<C-R>"<C-R>

" indenting a block of text w/out losing selection
vnoremap > >gv
vnoremap < <gv

" search and replace inside visual block
vnoremap <leader>s :s/\%V



" shadow arrow keys--------------------{{{
"mappings to shadow out arrow keys in normal mode
"inoremap <esc> <nop>
"nnoremap <right> <nop> 
"nnoremap <left> <nop> 
"nnoremap <up> <nop> 
"nnoremap <down> <nop> 
"inoremap <right> <nop> 
"inoremap <left> <nop> 
"inoremap <up> <nop> 
"inoremap <down> <nop> 
" }}}


"FILE SPECIFIC AUTOCOMMANDS -------------------{{{-
" cpp autocommands
augroup cpp_group
    autocmd!
    autocmd Filetype cpp set foldmethod=syntax
augroup END
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

""Statusline settings -------------------------------- {{{
"set statusline=%f			"relative path and filename
"set statusline+=\ -\ 		"separator
"set statusline +=FileType:%y	"Label and Filetype
"set statusline +=%=			" switch to right side
"set statusline +=[%5l/		" Current line
"set statusline +=%5L]		" Total lines
"" }}}

"vimscript file settings -----------------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim nnoremap <buffer> <leader>h i"<esc>20i-<esc>3i{<esc>o"<esc>3i}<esc>k0a
augroup END
" }}}

"tex settings -----------------------------{{{
nnoremap <leader>el :vsplit ~/.vim/bundle/snipmate.vim/snippets/tex.snippets<cr>
nnoremap <leader>et :vsplit ~/Library/texmf/tex/latex/armando.sty<cr>
augroup filetype_tex
	autocmd!
	"autocmd BufWritePost *.tex :silent execute "!pdflatex " . expand('%')
	autocmd BufWritePost *.tex :silent execute "!make > /dev/null 2>&1 & " 
	autocmd FileType tex setlocal foldmethod=indent
	autocmd FileType tex inoremap __ _{}<esc>i
	autocmd FileType tex inoremap ^^ <esc>i^{}<esc>i
	autocmd FileType tex inoremap <leader>ol <esc>i\begin{enumerate}<enter>\end{enumerate}<esc>O
augroup END
" }}}

"navigating window panes -----------------------------{{{
nnoremap gl <C-W>l
nnoremap gh <C-W>h
nnoremap gj <C-W>j
nnoremap gk <C-W>k
" }}}

"snipmate custom file type snippets  -----------------------------{{{
" }}}

" nerdcommenter comment for gringo
augroup GRINGO
autocmd!
autocmd BufNewFile,BufRead *.lp   setf gringo
autocmd FileType gringo let g:NERDCustomDelimiters = {
        \ 'gringo': { 'left': '%%'}
		\ }
augroup END

"python file settings -----------------------------{{{
augroup filetype_python
	autocmd!
	autocmd FileType python setlocal foldmethod=syntax
augroup END
" }}}

" custom delimiters used by NerdCommenter for gringo files
let g:NERDCustomDelimiters = {
\ 'gringo': { 'left': '%%', 'right' : '%%'}
\ }

" fugitive (git) plugin shortcuts
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gs :Gstatus <CR>
nnoremap <leader>gd :Gdiff <CR>


" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<space>


" alternative tab navigation
nnoremap , :tabnext<CR>
nnoremap < :tabprevious<CR>

" space characters used for tabs
set expandtab
set tabstop=4
set softtabstop=4   " backspace deletes 4 spaces in one go

set backspace=2 " backspace will behave like in other applications
