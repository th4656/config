call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/taglist.vim', {'for': ['cpp','java','c','python']}
Plug 'tomtom/tcomment_vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
" Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --system-libclang --system-boost'}
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-scripts/TaskList.vim', {'for' : ['cpp','c','java']}
Plug 'vim-scripts/javacomplete', {'for' : ['java']}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'jonathanfilip/vim-lucius'
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'scrooloose/syntastic', {'for': ['python']}
Plug 'gerw/vim-latex-suite'
Plug 'derekwyatt/vim-protodef'
Plug 'derekwyatt/vim-fswitch'
Plug 'oblitum/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang' }
Plug 'PeterRincker/vim-argumentative'
Plug 'Chiel92/vim-autoformat'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-lua-ftplugin'
Plug 'osyo-manga/vim-over'
Plug 'terryma/vim-expand-region'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'tpope/vim-fugitive'
Plug 'cohama/lexima.vim'
Plug 'joshdick/onedark.vim'
Plug 'thinca/vim-quickrun'
Plug 'Yggdroot/indentline'
Plug 'osyo-manga/vim-anzu'
Plug 'ludovicchabant/vim-gutentags'
Plug 'jdkanani/vim-material-theme'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" let g:python_host_skip_check=1
" let g:loaded_python3_provider=1

nnoremap <SPACE> <Nop>
let mapleader=" "
set scrolljump=5
set synmaxcol=180
set more
" set showmatch
set scrolloff=3
set linebreak
set noshowmode
set splitbelow
set splitright
set nopaste
set list
set noexpandtab
set autoindent
set history=1000
set wildignore+=*.bak,*.pyc,*.o,*.ojb,   " ignore said files
                    \*.a,*.pdf,*.jpg,*.gif,
                    \*.avi,*.mkv,*.so,*.png,
                    \*.swp, *.git, *.mp3, *.pdf,
                    \*.m4a

set foldcolumn=0
set foldnestmax=2
set foldlevelstart=99
set foldmethod=indent
set autoread
set confirm
set clipboard=unnamedplus
set backupdir=~/.vimbackup/
set undofile
set undodir=/home/terry/.vimundo/
set undolevels=1000
set undoreload=10000
set breakindent
let &showbreak = '↳ '
set cpo+=n

filetype plugin indent on
syntax on
colorscheme material-theme
set background=dark
set nu
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -T4pb
noremap <F3> :Autoformat<CR>
set smartindent
set scrolloff=10

"Box drawing characters for split lines
set fillchars=vert:│,fold:-
highlight VertSplit cterm=none ctermbg=none ctermfg=247

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<F2>"

let g:airline_powerline_fonts = 0
let g:airline_theme='lucius'

let g:airline_section_y= 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1

let g:ycm_confirm_extra_conf=0
nnoremap <leader>gt :YcmCompleter GetType<CR>
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
if argc() == 2
	n
	e #
endif
'
" let g:rainbow_active = 1

autocmd StdinReadPre * let s:std_in=1

map <F5> :QuickRun<CR>

"Easy Motion
map <Leader> <Plug>(easymotion-prefix)

"Tlist
let Tlist_GainFocus_On_ToggleOpen = 1
nnoremap <silent> <F1> :TlistToggle<CR>

"goto
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ge :YcmCompleter GoToDefinition<CR>

"mouse
" set mouse=a

"wildmenu
set wildmenu
set wildmode=list:longest,full

"searching
set ignorecase
set smartcase
set hlsearch

"tabs
set smarttab
set shiftwidth=4
set tabstop=4

"movement
nnoremap j gj
nnoremap k gk

"spell check
map <leader><leader>so :setlocal spell!<cr>

"Other
"^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Close buffer
nmap <Leader>x :bd<CR>"

"Buffer
nnoremap <C-N> :bprev<CR>
set hidden

"Open/close folds with space
nnoremap \ za
vnoremap \ za

set gdefault
set incsearch
set matchtime=2 " time to blink match {}
set matchpairs+=<:> " for ci< or ci>
set autochdir
set updatecount=50
set backspace=indent,eol,start
set cinkeys-=0#
set shiftround

"Only autocomment newline for block comments
augroup AutoBlockComment
	autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
augroup END

nnoremap <A-y> "+y
vnoremap <A-y> "+y
nnoremap <A-p> "+gP
vnoremap <A-p> "+gP

augroup RemovePreview
	autocmd!
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

let g:startify_bookmarks = [
			\ $HOME . "/Scripts/mangaupdate",
			\ $HOME . "/.config/mpv/mpv.conf",
			\ $HOME . "/.nvimrc"
			\ ]

nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>
" Remove multiple empty lines
function! DeleteMultipleEmptyLines()
	g/^\_$\n\_^$/d
endfunction

nnoremap <leader>st :call StripTrailingWhitespace()<CR>
"Strip trailing whitespace
function! StripTrailingWhitespace()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfunction

nnoremap H 0
nnoremap L $
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
set wrapscan

nnoremap <silent> <C-]> :YcmCompleter GoTo<cr>

let g:ycm_complete_in_comments = 1

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='zathura'
let g:cpp_class_scope_highlight = 1

let g:notes_suffic = '.txt'

let g:goyo_margin_top=2
let g:goyo_margin_bottom=2
let g:goyo_width=400

iab ddate <C-R>=strftime("%a %m/%d/%y")<CR>

map Y y$
set pastetoggle=<F7>
hi ErrorMsg ctermbg=0
hi SpellBad ctermfg=140 ctermbg=237 guifg=#yyyyyy guibg=#zzzzzz
hi SpellCap ctermfg=140 ctermbg=237 guifg=#yyyyyy guibg=#zzzzzz

map <leader>h :noh<cr>

let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'qf' : 1,
			\ 'markdown' : 1,
			\ 'unite' : 1,
			\ 'vimwiki' : 1,
			\ 'pandoc' : 1,
			\ 'infolog' : 1,
			\ 'mail' : 1
			\}

nnoremap <Leader>sr :source $MYVIMRC<CR>

function! Multiple_cursors_before()
  let s:old_ycm_whitelist = g:ycm_filetype_whitelist
  let g:ycm_filetype_whitelist = {}
endfunction

function! Multiple_cursors_after()
  let g:ycm_filetype_whitelist = s:old_ycm_whitelist
endfunction

let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Notes']
set guioptions=

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

imap <c-t> <Plug>(transform)
nmap <c-t> <Plug>(transform)

nnoremap <C-p> :bnext<CR>
"cpp/h
nnoremap <leader>sp :call SplitSourceHeader()<CR>
function! SplitSourceHeader()
	let s:fname = expand("%:t:r")
	if expand("%:e") == "h"
		set nosplitright
		exe "vsplit" fnameescape(s:fname . ".cpp")
		set splitright
	elseif expand("%:e") == "cpp"
		exe "vsplit" fnameescape(s:fname . ".h")
	endif
endfunction

map <F6> :NERDTreeToggle<CR>
nnoremap <F11> :w !sudo tee % >/dev/null<CR>
if has("autocmd")
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

"Java syntastic
set statusline+=%#warningmsg#
set statusline+=%*

let g:UltiSnipsUsePythonVersion = 3
nnoremap <C-b> :lnext<CR>

autocmd Filetype arduino set filetype=cpp

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:glsl_default_version = 'glsl130'

autocmd VimEnter * RainbowParentheses

let g:formatdef_myclangformat = "'clang-format'"
let g:formatters_cpp = ['myclangformat']
let g:formatters_c = ['myclangformat']

let g:lua_complete_omni = 1

"Japanese, use with :e ++enc=<encoding_name>
set fileencodings=utf8,iso-2022-jp,euc-jp,cp932,default,latin1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W>h

cabbrev %s OverCommandLine<cr>%s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s

map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

autocmd BufEnter * silent! lcd %:p:h "directory to current file

highlight TermCursor ctermfg=red guifg=red
tnoremap <Leader><ESC> <C-\><C-n>

let g:lexima_enable_basic_rules=0

nmap <F2> <Plug>ColorstepPrev

hi Search guibg=peru guifg=wheat
hi Search cterm=NONE ctermfg=grey ctermbg=blue

let g:jedi#force_py_version = 3

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
set statusline=%{anzu#search_status()}

let g:indentLine_color_term = 239

command! Q q
au BufWritePost *.tex silent !rubber --clean % && rubber --pdf %

let g:LargeFile=2
" shift arguments with <, and >,
"Protodec <leader>pp
"norm to append
"bd to delete buffer
