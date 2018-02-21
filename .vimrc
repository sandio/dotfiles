set shell=/bin/bash
set nocompatible
set hlsearch
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set mouse=a
set wildmenu
set backspace=indent,eol,start
set laststatus=2
set confirm
set list
set relativenumber
set number

"keep cursor at center of screen
set scrolloff=100

"autowrite on buffer change
set autowrite

"use comma for a leader key
let mapleader=","

"statusline fullpath
set statusline+=%F%m%=%P

"disable match pair except for insert
let g:loaded_matchparen=1

"check file change on buffer change
au BufEnter * checktime

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on

colorscheme solarized

"textwidth and colorcolumn
set textwidth=120
set colorcolumn=120
highlight ColorColumn ctermbg=black

"signcolumn
highlight SignColumn ctermfg=black ctermbg=black

"nontext
set listchars=eol:¬,tab:→→,trail:·
highlight NonText ctermfg=black
highlight SpecialKey ctermfg=black

"comments
highlight Comment cterm=italic
"
"folding
set foldmethod=indent
set foldlevelstart=1
nnoremap <Space> za
nmap zh [z
nmap zl ]z
highlight Folded cterm=italic

"free <C-J>
nnoremap <SID>black_hole <Plug>IMAP_JumpForward

"escape is too far
:imap jj <Esc>
:imap kk <Esc>
:imap ww <Esc>
:imap bb <Esc>

"a shift less
nnoremap ; :

"switch buffers
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nmap <Tab> :b#<CR>
nnoremap <Leader>w :bd<CR>

"Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"cscope tags
"use both cscope and ctag
set cscopetag
"use ctags with preference for tags
set cscopetagorder=1
"add any cscope database in current directory
if filereadable("cscope.out")
    cs add cscope.out
"else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
"symbol: find all references to the token under cursor
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"calls:  find all calls to the function name under cursor
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"called: find functions that function under cursor calls
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"ag grep
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" complete whole lines
:imap <C-l> <C-x><C-l>

"neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_fuzzy_completion=1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"neosnippet
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#scope_aliases={}
let g:neosnippet#scope_aliases['smarty']='html'
let g:neosnippet#scope_aliases['eruby']='eruby, html'
let g:neosnippet#scope_aliases['ruby']='ruby, rails'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"CtrlP
let g:ctrlp_cmd='CtrlPBuffer'
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=0
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window = 'max:20,results:40'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
highlight GitGutterAdd ctermfg=green ctermbg=black
highlight GitGutterChange ctermfg=yellow ctermbg=black
highlight GitGutterDelete ctermfg=red ctermbg=black
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=black

"syntastic
highlight SpellBad ctermbg=darkgrey
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

"vdebug
let g:vdebug_options={'watch_window_style' : 'compact'}

" tmux tslime
let g:tslime_always_current_session=1
let g:tslime_always_current_window=1

" rspec
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" supercollider
let g:sclangTerm="st -e $SHELL -ic"
let g:scFlash=1
