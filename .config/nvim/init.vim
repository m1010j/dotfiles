" Set leader key to space
let mapleader=" "
let maplocalleader=" "

call plug#begin()

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'itchyny/lightline.vim'

  Plug 'scrooloose/nerdcommenter'

  Plug 'scrooloose/nerdtree'

  Plug 'haishanh/night-owl.vim'

  Plug 'tpope/vim-fugitive'

  Plug 'tpope/vim-rhubarb'

  Plug 'HerringtonDarkholme/yats.vim'

  Plug 'yuttie/comfortable-motion.vim'

  Plug 'mileszs/ack.vim'

  Plug 'powerman/vim-plugin-autosess'

  Plug 'vim-scripts/auto-pairs-gentle'

call plug#end()

let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-tslint-plugin', 'coc-json', 'coc-highlight', 'coc-emmet', 'coc-css', 'coc-html']

""""" enable 24bit true color

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors")) 
 set termguicolors
endif

" Check if any buffers were changed outside of vim every time the cursor stops
" moving
au CursorHold,CursorHoldI * checktime

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme
colorscheme night-owl

" Enable mouse scrolling
set mouse=a

" Highlight current line
set cursorline

" Map 0 to ^ to use 0 to move to first non-blank character
map 0 ^

set colorcolumn=120

set number

set hidden

" Save 1,000 items in history
set history=1000

" Display the incomplete commands in the bottom right-hand side     of your screen.                                         
set showcmd

" Display completion matches on your status line
set wildmenu

" Display completion matches on your status line
set wildmenu

" Enable incremental searching
set incsearch

" Ignore case when searching
set ignorecase

" Override the 'ignorecase' option if the search pattern contai    ns upper case characters.                                
set smartcase

" Don't line wrap mid-word.
set lbr

" Copy the indentation from the current line.
set autoindent

" Enable smart autoindenting.
set smartindent

" Use spaces instead of tabs
set expandtab

" Enable smart tabs
set smarttab

" Make a tab equal to 4 spaces
set shiftwidth=2
set tabstop=2

set timeoutlen=500 ttimeoutlen=0

" Change cursor on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" When running search, highlight found words
set hlsearch

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Close quickfix and preview windows
nnoremap <Leader>X :ccl<CR>:pc<CR>

" Search word under cursor with leader-f
nnoremap <Leader>f #

" Save and quit shortcuts
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Tabbing shortcuts 
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>x :tabclose<CR>
nnoremap <Leader>[ :tabp<CR>
nnoremap <Leader>] :tabn<CR>
nnoremap <Leader>{ :tabm -1<CR>
nnoremap <Leader>} :tabm +1<CR>

" Move back and forth between two files by pressing the leader key twice
nnoremap <Leader><Leader> :e#<CR>

" Console log 20 new lines below current line
nnoremap <Leader>l oconsole.log('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n')<Esc>0
" Console log 20 new lines above current line
nnoremap <Leader>L Oconsole.log('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n')<Esc>0

" Show matching parentheses
set showmatch

" NERD Commenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" NERDTree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle %<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" fzf config
nnoremap <Leader>p :FZF<CR>
" Add fzf to runtimepath
if has('macunix')
  set rtp+=/usr/local/opt/fzf
elseif has('unix')
  set rtp+=~/.fzf
endif

" deoplete config
let g:deoplete#enable_at_startup = 1
"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" ack.vim config
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
noremap <Leader>F :Ack <cword><cr>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" coc.nvim config
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <leader>d <Plug>(coc-definition)
nmap <leader>y <Plug>(coc-type-definition)
nmap <leader>i <Plug>(coc-implementation)
nmap <leader>r <Plug>(coc-references)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier :CocCommand prettier.formatFile
