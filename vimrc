"executing vimrc after saving
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
"New lines inherit the indentation of previous lines.
set autoindent
"When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftround
"Ширина шифта
set shiftwidth=2
"При поиске игнорировать капс
set ignorecase
"А если с большой буквы то не игнорировать
set smartcase
"Don’t update screen during macro and script execution.
set lazyredraw
"Use an encoding that supports unicode
set encoding=utf-8
"Automatically re-read files if unmodified inside Vim.
set autoread
"Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start
"Delete comment characters when joining lines.
set formatoptions+=j
"path используется в поисках различных..
set path+=/home/nvidia/
"load the vimrc files inside the projects
set exrc
"Защита от этих внешних vimrc 
set secure
"Анализ шланга для подсказок
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
"Тут будут описаны плагины"
"colorscheme
Plug 'morhetz/gruvbox'
"colorscheme
Plug 'altercation/vim-colors-solarized'
"легкое выравнивание
Plug 'junegunn/vim-easy-align'
"Завершение скобочек и прочего
Plug 'jiangmiao/auto-pairs'
"Автопереход между c\h
Plug 'vim-scripts/a.vim'
"Plug 'scrooloose/syntastic'
"TODO: скомпилить hl-server, обеспечить функционирование
"/.vim/bundle/hl-server/build cmake .. make -j6
"Plug 'andrejlevkovitch/vim-hl-client'
"Какой-то параллелизм, хз..
Plug 'xolox/vim-misc'
"Автодополнение шланга, вроде работает
Plug 'rip-rip/clang_complete'
"подсветочки сипипи
Plug 'octol/vim-cpp-enhanced-highlight'
"быстрое переключение по кнопочкам
Plug 'easymotion/vim-easymotion'
"Ctrl+p
Plug 'kien/ctrlp.vim'
"Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
Plug 'ervandew/supertab'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"for easytags plagin
Plug 'universal-ctags/ctags'
"comments
Plug 'scrooloose/nerdcommenter'
"------------------=== Other ===----------------------
Plug 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plug 'fisadev/FixedTaskList.vim'  	" Pending tasks list <F2>
Plug 'rosenfeld/conque-term'      	" Consoles as buffers
Plug 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
"--------------=== Snippets support ===---------------
Plug 'garbas/vim-snipmate'		" Snippets manager
Plug 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plug 'tomtom/tlib_vim'		" dependencies #2
Plug 'honza/vim-snippets'		" snippets repo
"справа вылезает окошко со структурой тэгов файла
Plug 'majutsushi/tagbar'
"Много вещей
Plug 'xolox/vim-easytags'
call plug#end() "Перестать это делать

filetype plugin on
filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
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
nmap <F8> :TagbarToggle<CR>
map <F3> :NERDTreeToggle<C>
" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2
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
if @% == "/home/nvidia/.vimrc"
  silent :!cp ~/.vimrc ~/.vim/m_vim/vimrc
endif
  "=====================================================
let g:mapleader ='\'
map <Leader> <Plug> (easymotion-prefix)
:syn keyword Keyword Enumeration 
"let g:hl_server_binary  = "~/.vim/bundle//vim-hl-client/third-party/hl-server/"

"syntastics settings
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:easytags_autorecurse = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_async = 1
