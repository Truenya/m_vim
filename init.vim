"common settings
set tabstop=4
set shiftwidth=4
set noexpandtab
set filetype=1
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
inoremap jk <ESC>
let mapleader = "'"
set hlsearch " highlight all results
set ignorecase " ignore case in search
set incsearch " show search results as you type
" Easy autoinstall
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"tags
set tags=./tags;,tags;

call plug#begin()
" Suggestions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'
" Linter
Plug 'vim-syntastic/syntastic'
" clang-format 
Plug 'rhysd/vim-clang-format'
" qml helper
Plug 'peterhoeg/vim-qml'
" qmake helper
Plug 'artoj/qmake-syntax-vim'
" qt helper
Plug 'fedorenchik/qt-support.vim'
"supertab
Plug 'ervandew/supertab'
"vimcommander
Plug 'lpenz/vimcommander'
"python
Plug 'davidhalter/jedi-vim'
call plug#end()
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:coc_user_config = 1

" google linter
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" colors
let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'h', 'cpp']

" поведение
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
