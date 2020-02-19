""""""""""""""""""""""""""""
""""""  Vundle Setup  """"""
""""""""""""""""""""""""""""

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'junegunn/fzf'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wikitopian/hardmode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""
"""""" Plugin Settings """"""
"""""""""""""""""""""""""""""

" NERDTree
"map <silent> <C-n> :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFind<cr>
let NERDTreeQuitOnOpen=1

" Ctrl-P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ -g ""'
" Open Ctrl-P in the working directory.
nnoremap <Leader>o :CtrlP .<Cr>
" Open Ctrl-P in the directory of the current file.
nnoremap <Leader>O :CtrlP %:p:h<Cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = "-std=c++11 -pedantic"
let g:syntastic_python_python_exec = "/usr/bin/python3.4"
nnoremap <Leader>c :SyntasticCheck<Cr>
nnoremap <Leader>C :SyntasticReset<Cr>
autocmd VimEnter * :SyntasticToggleMode

" CommandT settings (disabled)
"nnoremap <Leader>o :CommandT<Cr>
"let g:CommandTMaxFiles=100000
"let g:CommandTFileScanner = "watchman"
"let g:CommandTWildIgnore = "*.o,*.obj,*~,*.*~"
"let g:CommandTTraverseSCM = "pwd"

" Airline
" enable symbols
let g:airline_powerline_fonts = 1
" fix symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
