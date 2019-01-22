set nocompatible
syntax on
filetype plugin on

set noswapfile

set tabstop=4     " a tab is four spaces
set softtabstop=0 " a
set shiftwidth=4  " number of spaces to use for autoindenting
set expandtab

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
set statusline+=\ col:%c                     "cursor line
set statusline+=\ %L                         "total lines
set statusline+=\ %P                         "percent through file

set showcmd       " Show command, i.e. key entered.

set hlsearch      " highlight search terms
set ignorecase    " Ignore case
set smartcase     " Ignore case until upper case is used in search
set incsearch     " show search matches as you type

" Show invis chars
set listchars=eol:§,tab:>-,trail:~,extends:>,precedes:<
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

" increment numbers
" visual g<C-a>
noremap + <c-a>
noremap - <c-x>

" Newlines and inser char
nmap oo o<Esc>
nmap OO O<Esc>
nnoremap <Space> i_<Esc>r

onoremap <silent> j gj
onoremap <silent> k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap Y y$

" Don't use arrows :/
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.tex setlocal spell et ts=4 sw=4
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd FileType gitcommit setlocal spell

execute pathogen#infect()

" ==================== Tabularize ====================
"" http://www.stephendiehl.com/posts/vim_2016.html
map <leader>a= :Tabularize /=<CR>
map <leader>a: :Tabularize /:<CR>
map <leader>a- :Tabularize /-<CR>

" ==================== delimitMate ====================
" src = github.com/jessfraz/.vim
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" ==================== Vim-go ====================
" src = github.com/jessfraz/.vim
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 0
let g:go_auto_type_info = 1

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)

au FileType go nmap <leader>r  <Plug>(go-run)

au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>dt  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)

au FileType go nmap <Leader>e <Plug>(go-rename)

" ==================== Syntastic ====================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0

let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_ocaml_checkers  = ['merlin']
let g:syntastic_go_checkers = ['gometalinter.v2', 'govet', 'errcheck', 'go']
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"] }

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

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
