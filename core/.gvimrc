" .gvimrc

" --------
" fonts: https://stackoverflow.com/questions/16882696/settings-default-font-in-gvim
" If the font has spaces, replace the spaces by '\ '
"   such as: set guifont=DejaVu\ Sans\ Mono\ Book\ 12
" --------
if has("gui_running")
  set guifont=Hack "10
endif

set lines=999 columns=999
set t_Co=256
highlight Normal ctermfg=black ctermbg=white
set background=light
" https://github.com/htv2012/vim-color-scheme-screenshots
color zellner
colorscheme zellner
syntax on
echo "All set, GUI"

" Lightline
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

