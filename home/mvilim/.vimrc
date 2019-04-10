set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'lyuts/vim-rtags'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'lukhio/vim-mapping-conflicts'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
Plugin 'fidian/hexmode'

" Note for YouCompleteMe -- can break when python version is updated -- should
" simply rerun the install script: /home/mvilim/.vim/bundle/YouCompleteMe/install.py 
" --system-libclang --clang-completer

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
"
"

syntax enable
set background=light

" lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set tags=./tags;

" Remove delay for key code timeouts
set timeoutlen=10000 ttimeoutlen=0

" Tab completion
set wildmenu
set wildmode=longest:full,full

" Line numbers
set number relativenumber
set lazyredraw
" Clipboard
set clipboard=unnamedplus

" Identation
" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartindent
set cindent
" Indents word-wrapped lines as much as the 'parent' line
set breakindent
set breakindentopt=shift:4
" Ensures word-wrap does not split words
set formatoptions=l
set lbr

" Allow cursor to go beyond EOL
set virtualedit=onemore
nnoremap $ $l

" Set line under cursor
set cursorline

" case insensitive on lowercase
set ignorecase
set smartcase

" status line
set laststatus=2
set statusline=%f
" allow hidden buffers
set hidden

" leader key mappings
let mapleader=" "
let maplocalleader=" "

" git gutter
set signcolumn=yes
set updatetime=100

" keep lines below and above
set scrolloff=5

" disable highlighting on escape in nvim (for use after search)
nnoremap <esc> :noh<return><esc>

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=238
match ExtraWhitespace /\s\+\%#\@<!$/
"Remove all trailing whitespace by pressing F5
nnoremap <leader>cw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" custom colors
hi MatchParen ctermbg=black ctermfg=white

" clang format mappings
nnoremap <silent> <leader>cf :ClangFormat<CR>

let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
    \ "AllowShortBlocksOnASingleLine" : "false",
    \ "AllowShortFunctionsOnASingleLine" : "Empty",
    \ }

" ycm mappings
" current issues:
" next error should cycle

" this flickers the location list -- it'd be better if we could open it invisibly
" it would be preferable to use a script to make it stateful and always be
" able to use cn
nnoremap <silent> <leader>ce :YcmDiags<CR>:ll<CR>:lcl<CR>
nnoremap <silent> <leader>cm :YcmDiags<CR>:ll<CR>
nnoremap <silent> <leader>ci :YcmCompleter FixIt<CR>

" ycm colors
highlight YcmErrorSection ctermbg=88
highlight YcmErrorSign ctermbg=88
highlight YcmWarningSection ctermbg=57
highlight YcmWarningSign ctermbg=57

" locationlist mappings
nnoremap <silent> <leader>ll :lop<CR>
nnoremap <silent> <leader>ln :lnext<CR>
nnoremap <silent> <leader>lp :lprev<CR>
" make location list close by default (and shift cr keeps it open)
autocmd FileType qf nnoremap <buffer> <silent> <cr> <cr>:lcl<cr>
autocmd FileType qf nnoremap <buffer> <silent> p <cr>:lop<cr>
autocmd FileType qf nnoremap <buffer> <silent> o <cr>
autocmd FileType qf nnoremap <buffer> <silent> <Esc> :lcl<cr>

" fzf mappings
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fw :Windows<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fl :BLines<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <leader>fa :Ag<CR>
nnoremap <silent> <leader>fr :Rg<CR>

" use fd as fzf find command
let $FZF_DEFAULT_COMMAND = "fd --type f"
" we would prefer first matching filenames (with a priority of length) and
" then match directories with a lower priority, but this is apparently not
" possible, so we choose to just match filenames
let $FZF_DEFAULT_OPTS = "--delimiter=/ --nth=-1"

" NERDTree mappings
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

" window navigation mappings
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wl <C-w>l

" ctrl-nav keys
nnoremap <C-j> <Down>
nnoremap <C-k> <Up>
nnoremap <C-h> <Left>
nnoremap <C-l> <Right>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" alt-nav keys
noremap <A-j> gj
noremap <A-k> gk
noremap <A-h> gh
noremap <A-l> gl

" gutter mappings
nnoremap <silent> <leader>gn :GitGutterNextHunk<CR>
nnoremap <silent> <leader>g<S-n> :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>gu :GitGutterUndoHunk<CR>
nnoremap <silent> <leader>gg :GitGutter<CR>

" cpp syntax highlighting config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" vimwiki config
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink
let g:vimwiki_folding='expr'
hi Folded ctermbg=23
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}

" fold config
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
