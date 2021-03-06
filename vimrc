" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colors-solarized
call vundle#begin()
let g:ycm_confirm_extra_conf = 0
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'klen/python-mode'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

call vundle#end()
call glaive#Install()
filetype plugin indent on
filetype plugin on

"ColorScheme
syntax enable
set background=dark
colorscheme solarized

" Global settings
"set bg=dark
filetype off
syntax on
set ai
set nu
set nocompatible
set tabstop=2
set backspace=2
set shiftwidth=2
set expandtab
set t_Co=256
set laststatus=2
set noshowmode
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
"set list listchars=tab:→\ ,trail:·
set autoread
set shortmess=at
set timeout timeoutlen=1000 ttimeoutlen=50
set hlsearch incsearch smartcase ignorecase
set completeopt=longest,menuone
set cot=menu
set wildignore+=*.o,*.log,*.obj,.git,*.jpg,*.png,*.gif,*/vendor/bundle,*/vendor/cache
cmap w!! w !sudo tee % > /dev/null
set title
set t_ts=k
set t_fs=\
set titlestring=vim-%{split(getcwd(),'\/')[-1]}

set cursorline
set cursorcolumn

set nofoldenable
set foldmethod=syntax
" Preferences
" Tree
let mapleader=","
nmap <silent> <leader>ne :NERDTree<CR>
nmap <silent> <leader>nc :NERDTreeClose<CR>
map <silent> <F1> :NERDTreeToggle<CR>
let NERDTreeWinPos="right"

" Tags & Search
map <silent> <F2> : !ctags -R --exclude=target --exclude=public --exclude=vendor .<CR>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left=1
let g:ctrlp_custom_ignore = {
  \ 'dir':  'vendor/bundle/*\|vendor/cache/*\|spec',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }
if executable("ack")
    nnoremap <leader>a :Ack 
    let g:ackprg="ack -H --smart-case --nocolor --nogroup --column
          \ --nocss --ignore-dir=vendor --ignore-dir=log --ignore-dir=tmp
          \ --ignore-file=is:Session.vim --ignore-file=is:tags"
    let g:ackhighlight=1
endif

" StatusLine
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.space = ' '
let g:airline_symbols.branch = '⎇'

" File types
autocmd BufNewFile,BufRead Thorfile set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
autocmd BufNewFile,BufRead pryrc set filetype=ruby
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType c,java,sh,javascript set ts=4 sw=4 sts=4 et
autocmd FileType go set ts=8 sw=8 sts=8

" Pymode 
let g: pymode_folding = 1
let g: pymode_motion = 1
let g: pymode_doc = 1
let g: pymode_doc_bind = 'K'



" open NERDTree automatically
"autocmd vimenter * NERDTree
" set F2 to control NERDTree
map <C-n> :NERDTreeToggle<CR>

" Auto formatting 
" augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
