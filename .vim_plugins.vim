
filetype off
call plug#begin()
" Plugin 'scrooloose/nerdtree'
" Plugin 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wikitopian/hardmode'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'fatih/vim-go'
Plug 'vim-python/python-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""""""""""""""""
"""""" Plugin Settings """"""
"""""""""""""""""""""""""""""

" NERDTree
"map <silent> <C-n> :NERDTreeFocus<CR>
" nnoremap <leader>f :NERDTreeFind<cr>
" let NERDTreeQuitOnOpen=1

" Ctrl-P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore "**.swp"
      \ --ignore "**~"
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ --ignore venv
      \ -g ""'
" Open Ctrl-P in the working directory.
let g:ctrlp_working_path_mode = 'a'
nnoremap <Leader>o :CtrlP .<Cr>
" Open Ctrl-P in the directory of the current file.
nnoremap <Leader>O :CtrlP %:p:h<Cr>

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cpp_compiler_options = "-std=c++11 -pedantic"
" let g:syntastic_python_python_exec = "/usr/bin/python3.4"
" nnoremap <Leader>c :SyntasticCheck<Cr>
" nnoremap <Leader>C :SyntasticReset<Cr>
" autocmd VimEnter * :SyntasticToggleMode

" CommandT settings (disabled)
"nnoremap <Leader>o :CommandT<Cr>
"let g:CommandTMaxFiles=100000
"let g:CommandTFileScanner = "watchman"
"let g:ctrlp_custom_ignore = "*.o,*.obj,*~,*.*~"
"let g:CommandTTraverseSCM = "pwd"

" Airline
" enable symbols
" let g:airline_powerline_fonts = 1
" fix symbols
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

" Hardmode
" nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

"Python-Syntax
let g:python_highlight_all = 1

" CoC
set encoding=utf-8
set updatetime=300
set signcolumn=yes

" Navigate autocomplete: j/k
inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Accept autocomplete: tab
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

" Jump to error: gn/gN
nnoremap gN <CMD>call CocAction('diagnosticPrevious')<CR>zz
nnoremap gn <CMD>call CocAction('diagnosticNext')<CR>zz
" nnoremap <Leader>N <CMD>call CocAction('diagnosticPrevious')<CR>zz
" nnoremap <Leader>n <CMD>call CocAction('diagnosticNext')<CR>zz

" Jump to def: gd
nmap <silent> gd <Plug>(coc-definition)

" Show hover info: gi
nmap <silent> gi <CMD>call CocAction('doHover')<CR>
" nmap <silent> gi <Plug>(coc-implementation)

" Show references: gr
nmap <silent> gr <Plug>(coc-references)

" Scroll through floating text: Ctrl-f/Ctrl-b
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "<ESC>\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
