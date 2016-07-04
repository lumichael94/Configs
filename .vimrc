filetype plugin indent on
set t_Co=256
set term=screen-256color
syntax on
colorscheme Tomorrow-Night 

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

" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
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

"autocomplete"
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Disabling vim's markdown folding"
let g:vim_markdown_folding_disabled=1

"Basic Pair Completion for {}"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}

"Basic Pair Completion for ()" 
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ()     ()

"Basic Pair Completion for []" 
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap []     []

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

