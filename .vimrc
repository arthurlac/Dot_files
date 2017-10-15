set nocompatible
syntax on
filetype plugin on

set wrap          " wrap lines
set tabstop=2     " a tab is two spaces
set softtabstop=0 " a
set shiftwidth=2  " number of spaces to use for autoindenting
set expandtab     " On pressing tab, insert 4 spaces

set nosmartindent
set autoindent

colorscheme onedark

filetype plugin indent on

set number        " Line numbers

set statusline+=%#warningmsg#                "Syntastic
set statusline+=%{SyntasticStatuslineFlag()} "Syntastic
set statusline+=%*                           "Syntastic
set statusline+=%=                           "left/right separator
set statusline+=%h                           "help file flag
set statusline+=%m                           "modified flag
set statusline+=%r                           "read only flag
set statusline+=\ %t                         "tail of the filename
set statusline+=\ %c,                        "cursor column
set statusline+=%l/%L                        "cursor line/total lines
set statusline+=\ %P                         "percent through file

set showcmd       " Show command, i.e. key entered.

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Show invis chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Folds
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set foldlevelstart=10   " open most folds by default

" Show opts in file selec
set wildmenu

" highlight current line
set cursorline

" Change split loc
set splitright

" Remap :W to :w
command WQ wq
command Wq wq
command W w
command Q q

" One less key buffer moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Newlines and inser char
nmap oo o<Esc>
nmap OO O<Esc>
nnoremap <Space> i_<Esc>r
"
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Don't use arrows :/
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

execute pathogen#infect()

"" http://www.stephendiehl.com/posts/vim_2016.html
map <leader>a= :Tabularize /=<CR>
map <leader>a; :Tabularize /::<CR>
map <leader>a- :Tabularize /-><CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0

let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler     = 'clang'

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ocaml_checkers  = ['merlin']

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## e46aecf82e46907156237f73ea993e68 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/Artlac/.opam/system/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
