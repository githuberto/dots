" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

" Don't use Ex mode, use Q for word wrapping
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal hascolors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""        My changes        """""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "

" Indentation
set tabstop=2       " tab width
set softtabstop=2   " number of space deleted
set shiftwidth=2    " number of spaces inserted
set expandtab       " spaces instead of tabs

let g:loaded_matchparen=1

" Showing whitespace
" set list lcs=eol:¬,trail:·,tab:▸\ 
set list lcs=trail:·,tab:▸\ 

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Leader binds
nnoremap <Leader>t :set paste!<CR>:set paste?<CR>

" Clipboard support
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Show the current registers
nnoremap <Leader>r :reg<CR>

" Show and clean messages
nnoremap <Leader>m :messages<CR>
nnoremap <Leader>cm :messages clear<CR>

" Change terminal title
set title

" Better tab menu
set wildmenu

" Search case-insensitive if all lowercase
set ignorecase
set smartcase
" Disable this when in insert mode so that <C-n> is still sensitive.
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase

" Clear search highlighting without asdfadf
nmap <silent> ,/ :nohlsearch<CR>

" Long history
set history=1000        " command
set undolevels=1000     " undo

" Move by visual lines
noremap j gj
noremap k gk

" Join lines without producing a silly space
" noremap J Jx

" Relative line numbers
set relativenumber
set nu

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Filetype specific settings
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=2 softtabstop=2 shiftwidth=2
"autocmd FileType python setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType make setlocal noexpandtab

" Quickly edit/reload vimrc
" let s:dot_path = expand("~/dots/.vimrc")
" if filereadable(s:dot_path)
"     let g:vimrc_loc = s:dot_path
" else
"     let g:vimrc_loc = $MYVIMRC
" endif
"
let g:vimrc_loc = $MYVIMRC

:execute "nmap <silent> <leader>ev :tabedit" . g:vimrc_loc . "<CR>"
:execute "nmap <silent> <leader>sv :so" . g:vimrc_loc . "<CR>"
nmap <silent> <leader>eb :tabedit ~/.bashrc <CR>
nmap <silent> <leader>et :tabedit ~/.tmux.conf <CR>

" Timeout length for mapping commands
set ttimeoutlen=0

" Highlight columns over 80 characters
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%82v', 100) "set column nr

" scroll with cursor (disabled for vim-tmux)
"nnoremap <C-j> <C-E>j
"nnoremap <C-k> <C-Y>k

" Intuitive placement of vim splits
set splitbelow
set splitright

" Disable folds
set nofoldenable
set mouse=

" Make the vertical split divider pretty like tmux
set fillchars+=vert:│
hi VertSplit cterm=NONE

" Add Go support
set rtp+=$GOROOT/misc/vim

" WSL Vim starting in replace mode.
set t_u7=

" Save and load text folding
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Colors
colorscheme desert

" Status line
set statusline=hi
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %r

" backup and undo history
set undofile
set undodir=~/.vim/undodir/,.
set backupdir=~/.vim/backup//,.,/tmp/
set directory=~/.vim/backup//,.,/tmp/

" make wrapped lines more obvious
let &showbreak = "  ↳ "

" show search count message
set shortmess-=S

" make search highlighting readable
" hi Search ctermfg=black ctermbg=yellow
" hi IncSearch ctermfg=black ctermbg=yellow

hi Search guifg=#ff0000 guibg=#00ff00

" Abbreviations
iabbr dism itx.response.send_message
iabbr difs itx.followup.send
iabbr ditx itx: discord.Interaction

" highlight the current line
" let cursorbg=darkgrey
hi CursorLine ctermbg=236 cterm=bold
hi CursorLineNr ctermbg=236 cterm=bold
