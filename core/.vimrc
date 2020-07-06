" ~/.vimrc

" define interactive shell, load ~/.bashrc
set shellcmdflag=-ic

" pablo is preinstalled in vim 7.4 
if has("gui_running")
    set background=light
    color default
    colorscheme default
    highlight Normal ctermfg=black ctermbg=white
    set background=light
    " https://github.com/htv2012/vim-color-scheme-screenshots
    color zellner
    colorscheme zellner
    syntax on
else
    set background=dark
    color pablo
endif

" 
filetype off

" line numbers
set number

" syntax highlighting
syntax on

" splitting rules
set splitbelow "force new window below on :sp
set splitright "force new window to the right

" status bar
set laststatus=2

" fast
set ttyfast

" status display ~ refer to Lightline plugin instead, below.
" set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
" set showcmd

" Encoding
set encoding=utf-8

" highlight brackets
set matchpairs+=<:>

" smart tabbing by file
au BufRead,BufNewFile *.py set expandtab

" smart tabbing behavior
set expandtab
set textwidth=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" smart backspace
set backspace=indent,eol,start

" set wrap text
set wrap

" smart visibility 1 line above/below cursor
" set scrolloff

" makes :set list! prettier
" set listchars

" Highlight search patterns
set hlsearch
" Incremental search
set incsearch
" Ignore case for search
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" <Tab> once and twice for autocomplete commands
set wildmenu
set wildmode=list:longest,full

" use the :emenu command for options this way.

" n works in Vim normal mode only
" use CTRL left and CTRL right in normal mode to switch tabs (use CTRL left/right in insert mode to switch words)
nnoremap <C-Left>       :tabprevious<CR>
nnoremap <C-Right>      :tabnext<CR>

" use CTRL t to create a new tab CO/CC will leave insert/visual mode temporarily to write commands. In visual mode
" Ctrl s will save, and return to normal mode.
nnoremap <C-t>          :tabnew<CR>
inoremap <silent><C-t>  <C-O>:tabnew<CR>
nnoremap <C-s>          :update<CR>
vnoremap <silent><C-s>  <C-C>:update<CR>
inoremap <silent><C-s>  <C-O>:update<CR>

" use CTRL w or CTRL w q to write, then exit tab. Requires interaction if currently insert mode. Only works in gui mode.
if has("gui_running")
    nnoremap <C-w>          :wq<CR>
    nnoremap <C-w><C-q>     :wq<CR>
else
    nnoremap <C-w>          :w<CR>
    nnoremap <C-w><C-q>     :wall<CR>
endif
" inoremap <C-w>          :wq "don't do this, because insert mode's <C-w> maps to delete word.

" use CTRL q, e to force exit without saving. This requires user interaction (press enter (<CR>) in the Vim command prompt)
nnoremap <C-q><C-e>     :q!

" use CTRL l,l  OR CTRL t,e,r to open terminal in lower half, and run 'exit' in Bash to leave it later
nnoremap <C-l><C-l>     :term<CR>
vnoremap <C-l><C-l>     <C-C>:term<CR>
inoremap <C-l><C-l>     <C-O>:term<CR>

nnoremap <C-t><C-e><C-r> :term<CR>

" use CTRL j and CTRL k to toggle tabs
nnoremap <C-j>          gT
nnoremap <C-k>          gt

" use CTRL backspace to erase word <C-W> through smart backspace above. i works in insert mode.
imap <C-BS>             <C-W>

" use CTRL Space to view autocomplete
inoremap <silent><C-Space>  <C-p>

" search with <z> in visual mode. n for next, N for previous.
" note, that <zz> in visual mode takes cursor to center of screen, which is also nice.
vnoremap <z>        <C-C>y/\V<C-R>=escape(@",'/\')<CR><CR>

" search shortcut
inoremap <C-f>          <C-O>/
vnoremap <C-f>          <C-C>/
nnoremap <C-f>          /

" Delete selected text with 'd' or backspace
vnoremap <BS>           d

"
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y
set clipboard=unnamedplus

" Map <Home> to first nonblank character 
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Open a tab with Ctrl o
noremap <C-o>   :tabnew  
vnoremap <C-o>  <C-C>:tabnew

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" https://github.com/junegunn/vim-emoji
" https://github.com/airblade/vim-gitgutter
" https://www.webfx.com/tools/emoji-cheat-sheet/
set completefunc=emoji#complete
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_modified_removed = '~x'
let g:gitgutter_set_sign_backgrounds = 1
set signcolumn=yes

if has("gui_running")
    highlight SignColumn guibg=white ctermbg=white
    highlight GitGutterAdd    guifg=#009900 ctermfg=2
    highlight GitGutterChange guifg=#bbbb00 ctermfg=3
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1
else
    highlight SignColumn guibg=#0E0E0E ctermbg=black
    highlight GitGutterAdd    guifg=#D2E9FD ctermfg=2
    highlight GitGutterChange guifg=#87FF00 ctermfg=3
    highlight GitGutterDelete guifg=#D7005F ctermfg=1
endif

set updatetime=100

" Jedi
" let g:jedi#force_py_version = 3
let g:jedi#popup_on_dot = 0
set noshowmode
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 100
hi Function ctermbg=none ctermfg=blue
hi jediFat ctermbg=none ctermfg=red
hi jediFunction ctermbg=none ctermfg=black

" Ale - lint only on save.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
" let g:ale_lint_delay = 5000
let g:ale_sign_column_always = 1
let g:ale_sign_error = ' !'
let g:ale_sign_warning = ' *'
highlight ALEErrorSign ctermbg=red
highlight ALEWarningSign ctermbg=white

" Lightline
if has("gui_running")
    let g:lightline = {
          \ 'colorscheme': 'ayu_light',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }
else
    let g:lightline = {
          \ 'colorscheme': 'molokai',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }
endif
