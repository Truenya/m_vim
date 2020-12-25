augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set path+=/home/nvidia/
set exrc
set secure
"set pyx=3

 let g:clang_library_path='/usr/lib/llvm-8/lib/libclang.so.1'

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
"Тут будут описаны наши плагины""
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'


Plug 'scrooloose/syntastic'

"TODO: скомпилить hl-server, обеспечить функционирование
"/.vim/bundle/hl-server/build cmake .. make -j6
"Plug 'andrejlevkovitch/vim-hl-client'
Plug 'xolox/vim-misc'
"XML
"XMLPlug 'othree/xml'
Plug 'rip-rip/clang_complete'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
"Ctrl+p
Plug 'kien/ctrlp.vim'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'jupyter-vim/jupyter-vim'
"Plug 'majutsushi/tagbar'
" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" https://github.com/scrooloose/nerdtree
"Plug 'scrooloose/nerdtree'

" https://github.com/ervandew/supertab
Plug 'ervandew/supertab'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
set pyx=3

Plug 'altercation/vim-colors-solarized'



" Unmanaged plugin (manually installed and updated)


Plug 'universal-ctags/ctags'

"Plug '~/my-prototype-plugin'
"------------------=== Other ===----------------------
Plug 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plug 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plug 'rosenfeld/conque-term'      	" Consoles as buffers
Plug 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
"Plug 'garbas/vim-snipmate'		" Snippets manager
"Plug 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plug 'tomtom/tlib_vim'		" dependencies #2
"Plug 'honza/vim-snippets'		" snippets repo
"comments
Plug 'scrooloose/nerdcommenter'
"---------------=== Languages support ===-------------
" --- Python ---
"Plug 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
"Plug 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
"Plug 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plug 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
call plug#end() "Перестать это делать
filetype plugin on
filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
"set pythonthreedll=/usr/local/bin/python3

syntax on
colorscheme gruvbox
"colorscheme solarized
set bg=dark
set background=dark
set laststatus=2
set noshowmode
let g:solarized_termcolors=256
autocmd vimenter * TagbarToggle
"autocmd vimenter * NERDTree
tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set visualbell t_vb=0 
set novisualbell       

set enc=utf-8	     " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch	     " инкреминтируемый поиск
set hlsearch	     " подсветка результатов поиска
set nu	             " показывать номера строк
set scrolloff=5	     " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" прячем панельки
"set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

" настройка на Tab
"set smarttab
set expandtab
set tabstop=2

"  при переходе за границу в 140 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%160v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
"let g:snippets_dir = "~/.vim/vim-snippets/snippets"
"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0

" документация
"let g:pymode_doc = 0
"let g:pymode_doc_key = 'K'
" проверка кода
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
"let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
"let g:pymode_lint_write = 1
nmap <F8> :TagbarToggle<CR>
" поддержка virtualenv
"let g:pymode_virtualenv = 1

" установка breakpoints
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
"let g:pymode_folding = 0

" возможность запускать код
"let g:pymode_run = 0

map <F3> :NERDTreeToggle<C>
"игнорируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2
" Disable choose first function/method at autocomplete

"=====================================================
" User hotkeys
"=====================================================
" ConqueTerm
" запуск интерпретатора на F5
"nnoremap <F5> :ConqueTermSplit ipython<CR>
" а debug-mode на <F6>
"nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
"let g:ConqueTerm_StartMessages = 0
"let g:ConqueTerm_CloseOnEnd = 0
" проверка кода в соответствии с PEP8 через <leader>8
"autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1


let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

let g:cpp_concepts_highlight = 1

let c_no_curly_error=1

" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>
"сохранение конфига для гита
:!cp ~/.vimrc ~/.vim/m_vim/vimrc
"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
"autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
"\ formatoptions+=croq softtabstop=4 smartindent
"\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,wit
let g:mapleader ='\'
map <Leader> <Plug> (easymotion-prefix)
:syn keyword Keyword Enumeration 
"let g:jedi#popup_select_first = 0
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:hl_server_binary  = "~/.vim/bundle//vim-hl-client/third-party/hl-server/"

"syntastics settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_confirm_extra_conf = 0
