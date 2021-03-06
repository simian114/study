set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on
call vundle#begin()

"let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" 42header
Plugin 'pbondoer/vim-42header'

" multiline editing
Plugin 'terryma/vim-multiple-cursors'

Plugin 'surround.vim'
Plugin 'scrooloose/nerdcommenter'

Plugin 'Raimondi/delimitMate'
Plugin 'Tagbar'
Plugin 'neocomplcache'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'fugitive.vim'
Plugin 'gtags.vim'
Plugin 'lrvick/Conque-Shell'
Plugin 'DoxygenToolkit.vim'
Plugin 'SearchComplete'
" indentline
Plugin 'Yggdroot/indentLine'
" Markdown
Plugin 'shime/vim-livedown'
" Ctags
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
" vim theme
Plugin 'morhetz/gruvbox'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'Vimjas/vim-python-pep8-indent'

call vundle#end()
"======================= key mapping =======================
nmap <F2> :Stdheader<CR>
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

:imap <C-b> <BACKSPACE>

" 화면 분할 후 이동
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" 분할 화면 닫기
nnoremap <C-Q> <C-W>q

cabbrev vb vert sb

" 분할 창 크기 조절
nnoremap <C-UP> <C-W>-
nnoremap <C-DOWN> <C-W>+
nnoremap <C-RIGHT> <C-W>>
nnoremap <C-LEFT> <C-W><

" 자동완성
":imap <C-'> <C-p>

" 재빠르게 jk누르면 인서트모드 나가짐
:imap hj <Esc>

" ESC + / -> 주석

" Save and Quit!
map <C-c> <ESC>:w<CR>
noremap <C-c> <ESC>:w<CR>
":imap <C-c> <ESC>:w<CR>
map <C-x> <ESC>:wq<CR>
:imap <C-x> <ESC>:wq<CR>

" Folding
map <F9> v]}zf
map <F10> zo

" Moving line

nnoremap ,ms <S-k>

nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+1<CR>


" 파일 버퍼 간 이동
" 원하는 파일 버퍼로 이동하기
" 파일 여러개 동시에 편집 작업하는 경우
map ,` :ls<CR>
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>

" 다음 파일 버퍼로 이동
nnoremap <S-l> :bn!<CR>
" nnoremap <Tab> :bn!<CR>

" 이 전 파일 버퍼로 이동
" map ,c :!gcc *.c && ./a.out<CR>
nnoremap <S-h> :bp!<CR>

" 현재 파일 버퍼 닫음
map ,w :bw<CR>

"==================== theme ========================
colorscheme gruvbox
"set dark mode
set bg=dark
" let g:airline_theme = 'codedark'

"===================== man page 설정 =========================
"

func! Man()
	let sm = expand("<cword>")
		exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
		endfunc
		nmap ,ma :call Man ()<cr><cr>

"===================== ctags 설정
set tags=./tags
nnoremap <C-f> <C-]>
nnoremap <C-d> <C-t>
"map <C-[> :!ctags -R<CR><CR>
nnoremap <C-g> :!ctags -R<CR><CR>

map <F8> :TagbarToggle<CR>

if len(filter(range(argc()), 'getfsize(argv(v:val))>pow(1024,3)*7')) > 0
  echomsg "Hey! Vim will quit VLC!"
    sleep 3
	  cquit!
endif
autocmd BufReadPre * if getfsize(expand("<afile>"))>pow(1024,3)*7|echomsg "Hey! Vim will quit VLC"|sleep 3|cquit!|endif

autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

"===================== 기본 설정========================
" indent line
set cursorline
set ruler
set tabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a


set autoindent
set cindent

set nu

" 검색할 때 대소문자 구분 x
set ignorecase

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let delimitMate_expand_cr=1

let mapleader=","
" NERD Commenter
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment

if has ("syntax")
	syntax on
endif

