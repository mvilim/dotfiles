set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" code integration
Plugin 'neoclide/coc.nvim'
Plugin 'rhysd/vim-clang-format'
Plugin 'Shougo/vimproc.vim' " required by vim vebugger
Plugin 'idanarye/vim-vebugger'

" productivity
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'fidian/hexmode'
Plugin 'bfredl/nvim-ipy'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mvilim/nvim_ipykm'
Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'

" vim specific
Plugin 'lukhio/vim-mapping-conflicts'
Plugin 'itchyny/lightline.vim'
Plugin 'luochen1990/rainbow'

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

" source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

syntax enable
set background=light

" lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

set tags=./tags;

" vebugger settings
let g:vebugger_leader='<space>d'
nnoremap <space>ddi :VBGrawWrite info locals<enter>
nnoremap <space>ddb :VBGrawWrite backtrace<enter>

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
hi CursorLine term=underline cterm=NONE gui=NONE ctermbg=236

" Warn on search wrap
hi WarningMsg ctermfg=white ctermbg=red guifg=White guibg=Red gui=None

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
nnoremap <esc> :noh<bar>:pclose<return><esc>

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=238
match ExtraWhitespace /\s\+\%#\@<!$/
"Remove all trailing whitespace by pressing F5
nnoremap <leader>cw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" custom colors
hi MatchParen ctermbg=black ctermfg=white

" make ro buffers noma
autocmd BufRead * let &l:modifiable = !&readonly

" clang format mappings
nnoremap <silent> <leader>cf :ClangFormat<CR>

let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
    \ "AllowShortBlocksOnASingleLine" : "false",
    \ "AllowShortFunctionsOnASingleLine" : "Empty",
    \ }

" COC config

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" COC mappings
nnoremap <silent> <leader>gN <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>gn <Plug>(coc-diagnostic-next)

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nnoremap <silent> <leader>ge  :<C-u>CocList diagnostics<cr>

nnoremap <silent> <leader>gs :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>gf  <Plug>(coc-fix-current)

inoremap <silent><expr> <c-space> coc#refresh()

hi CocHighlightText ctermfg=white

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <CR>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<CR>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" this should only be set for file completions -- it breaks things like
" looking for string matches in the current file
let $FZF_DEFAULT_OPTS = "--delimiter=/ --nth=-1,.. --tiebreak=end"

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

" code execution keys
map <Leader>ee <Plug>(IPy-Run)
map <Leader>ec <Plug>(IPy-RunCell)
map <Leader>ea <Plug>(IPy-RunAll)
map <Leader>ep <Plug>(IPy-Complete)
map <Leader>ei <Plug>(IPy-WordInfo)
map <Leader>es <Plug>(IPy-Interrupt)
map <Leader>et <Plug>(IPy-Terminate)

" ipython cell defes
let g:ipy_celldef = '^##'

nmap <leader>p <Plug>yankstack_substitute_older_paste<CR>
nmap <leader>P <Plug>yankstack_substitute_newer_paste<CR>

set nomodeline

let g:gundo_prefer_python3 = 1
" nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
set undodir=/tmp/vim_undo/
set undofile

let g:rainbow_active = 1

" nvim-ipykm mappings
nnoremap <leader>kk <Cmd>IPyConnectKernel<cr>
set winminheight=0
let g:ipython_args = '--no-window'

" disable statusline when fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" allow nvim_ipykm zero height windows
set winminheight=0
