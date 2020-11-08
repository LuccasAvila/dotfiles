" Remap the leader key to ,
let g:mapleader=','

" Remove errors bells
set noerrorbells
set visualbell
" Active the autoindent
set autoindent

" Set relative numbers
set relativenumber

" Hides buffer instead of closing them
set hidden

" Remove the backup
set nobackup
set nowritebackup
set noswapfile

" Only one line for command line
set cmdheight=1

" Set the update time from 4000 to 300
" For a more smoothly use
set updatetime=300

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Use space instead of tabs
set expandtab

" Set the <tab> space count
set softtabstop=2

" Set the space count of < and > command
set shiftwidth=2

" Do not wrap the line by default
set nowrap

" Set the syntax support
syntax on

" Remove the highlight on searched item
set nohlsearch

" Change mouse vim support type
set mouse=a

" Send more characters to redraw
set ttyfast

" ======= Plugins =======
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'

Plug 'itchyny/lightline.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'editorconfig/editorconfig-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'

Plug 'ap/vim-css-color'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

" ======= fzf config ======= "
" Use <C-p> to open Git Files Search
nnoremap <C-p> :GFiles<CR>

" ======= CoC config ======= "
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ======= NERDTree Configuration ======= "
" Auto start with NERDTree opened with the workspace
" who is selected in command
autocmd VimEnter */workspace/* NERDTree| wincmd p
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
" Toggle the NERDTree panel with <C-b>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Exit nvim when the only remaining window opened is the NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Decrease NERDTree size
let g:NERDTreeWinSize=20

" ======= Lightline ======= "
" Lightline configuration
" Set the lightline colorscheme to material_vim
" Add Vim-Fugitive to lightline
let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ======= VimGutter config ======= "
" Always show the sign column
set signcolumn=yes

" ======= Markdown preview ======= "
" Do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" Open Markdown Preview pressing <M-m>
nnoremap <M-m> <Plug>:MarkdownPreview

" ======= Appearence ======= "
" Set the material theme to the darker variant
let g:material_theme_style = 'darker-community'
" Set the colorscheme to material
colorscheme material

" Enable true colors support
if (has('termguicolors'))
  set termguicolors
endif

