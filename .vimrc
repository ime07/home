set nocompatible "vi非互換モード"
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim.git
    call neobundle#rc(expand('~/.bundle'))
endif
NeoBundle 'http://github.com/soh335/vim-symfony.git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
" NeoBundle 'git://github.com/fholgado/minibufexpl.vim.git'
" NeoBundle 'git://github.com/vim-scripts/buftabs.git'
" NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/majutsushi/tagbar.git'
NeoBundle 'git://github.com/jdonaldson/vaxe.git'
NeoBundle 'git://github.com/jdonaldson/vim-powerline.git'
NeoBundle 'git://github.com/docteurklein/php-getter-setter.vim.git'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'surround.vim'
NeoBundle 'Shougo/vimproc', {
     \ 'build' : {
     \     'mac' : 'make -f make_mac.mak',
     \     'unix' : 'make -f make_unix.mak',
     \    },
     \ }
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_enable_signs=8
function PHPLint()
    let result = system( &ft . ' -l ' . bufname(""))
        echo result
endfunction
autocmd FileType php  :nmap ,l :call PHPLint()<CR>
autocmd FileType ruby  :nmap ,l :w !ruby -c<CR>
filetype plugin on
filetype indent on
set backspace=start,eol,indent
" 補完ウィンドウの設定
set completeopt=menuone
" ディレクトリ補完時にスラッシュを補う
let g:vimshell_enable_auto_slash = 1
"
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
"
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
"
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
"
let g:neocomplcache_enable_camel_case_completion  =  1
"
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"
let g:buftabs_marker_modified = "+"
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
map <C-t> :tabnew<CR>
map <C-n> :tabnext<CR>
map <C-p> :tabprevious<CR>
map :qq<CR> :tabc<CR>
map :Sh<CR> :VimShell<CR>
map :Gs<CR> :InsertBothGetterSetter<CR>
nmap <F8> :TagbarToggle<CR>
map :vi<CR> :call vaxe#ImportClass()<CR>
map :ub<CR> :Unite buffer<CR>


map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
map <BS> <Nop>
map <Enter> <Nop>
map <C-Enter> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <BS> <Nop>
inoremap <Enter> <Nop>
inoremap <C-Enter> <Nop>
" noremap h b
" noremap l w

set number
set ruler
set nolist
set nobackup
set autoindent
set list
set listchars=eol:↩,trail:-,tab:>\ ,extends:<
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set expandtab
set ts=4 sw=4 sts=0
set shiftwidth=4
set showmatch
set smartindent
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set ic
set clipboard=unnamed
set autowrite
autocmd FileType php :set dictionary=~/.vim/dict/php_func.dict
autocmd FileType php :set tags=~/.vim/tags/symfony.tags,~/.vim/tags/symfonycode.tags
"set tags=~/.vim/tags/.htags,~/.vim/tags/.haxetags
set mouse=niv
set clipboard=unnamed
set directory=/tmp
set laststatus=2
set hlsearch
set viminfo='20,\"200,:20,%,n~/.viminfo
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd BufWritePre * :%s/\s\+$//ge
" autocmd BufWritePre * :%s/\n\{2,\}$//ge
autocmd FileType php autocmd BufWritePre * :%s/\t/    /ge
autocmd FileType ruby autocmd BufWritePre * :%s/\t/  /ge
autocmd FileType coffee autocmd BufWritePre * :%s/\t/  /ge
autocmd BufEnter *.php :set syn=php
autocmd BufEnter *.slim :set syn=slim
autocmd BufEnter *.rb,*.slim,*.yml,*.ru,*.rake,*.coffee :set ts=2 sw=2 sts=0
let g:alpaca_update_tags_config = {
      \ '_' : '-R --exclude=*/vendor/* --sort=yes --languages=-js,html,css',
      \ 'ruby': '--languages=+Ruby',
      \ }
autocmd BufWritePost * TagsUpdate TagsSet
autocmd BufEnter * TagsSet
if has('syntax')
    syntax enable
    set t_Co=256
    "colorscheme desert
    "colorscheme zenburn
    let g:solarized_termcolors=16
    let g:solarized_termtrans=0
    let g:solarized_degrade=0
    let g:solarized_bold=1
    let g:solarized_underline=1
    let g:solarized_italic=1
    let g:solarized_contrast='normal'
    let g:solarized_visibility='normal'
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
    "autocmd BufEnter *.rb,*.slim,*.ru :colorscheme railscasts
endif
