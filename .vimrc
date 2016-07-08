filetype plugin indent on
set t_Co=256
set term=screen-256color
syntax on
colorscheme onedark

"Line numbers"
set relativenumber 
set number

"Tab Spacing"
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

"Pathogen"
execute pathogen#infect()

"My vim-airline configs
"to enable a tab bar in vim (technically buffers)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#fnamemod = ':t'

" 24-bit color support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Changing leader key to comma
" let mapleader = ","

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Jump to buffer"
nmap <leader>b :buffer<CR>

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Toggle syntastic check"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"Pastetoggle"
set pastetoggle=<f5>

"Used to get rid of the excess time it takes to 'escape'"
set timeoutlen=1000 ttimeoutlen=0

"Saving and restoring views"
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview 

"Disabling vim's markdown folding"
let g:vim_markdown_folding_disabled=1

""Basic Pair Completion for {}"
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {}     {}
"
""Basic Pair Completion for ()" 
"inoremap (      ()<Left>
"inoremap (<CR>  (<CR>)<Esc>O
"inoremap ()     ()
"
""Basic Pair Completion for []" 
"inoremap [      []<Left>
"inoremap [<CR>  [<CR>]<Esc>O
"inoremap []     []

"NerdTree
nmap <leader>e :NERDTreeToggle<CR>
"Close vim if only window left if NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowLineNumbers=1

"insert new line without entering insert mode"
nmap <S-Enter> O<Esc>j

"VIM Rust Racer
let g:racer_cmd = "/home/developer/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/local/src/rustc-nightly/src"

"Neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
set completeopt-=preview

"VIM GO
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gs <Plug>(go-implements)
au FileType go nmap <leader>ge <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" VIM Splits, Resizing, Movement
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

