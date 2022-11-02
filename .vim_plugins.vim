
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
" Plugin 'OmniSharp/omnisharp-vim'
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
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>sspd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>sspi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>q <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ssca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ss. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ss. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>ss= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>ssnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>ssre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ssst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>sssp <Plug>(omnisharp_stop_server)
augroup END

let g:OmniSharp_translate_cygwin_wsl = 1

let g:ale_linters = {
      \ 'cs': ['OmniSharp'],
      \}
let b:ale_linters = ['cs']

"Python-Syntax
let g:python_highlight_all = 1

" CoC
set encoding=utf-8
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
