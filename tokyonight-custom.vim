" Vim-Plug Installing Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'ghifarit53/tokyonight-vim'
Plug 'mhinz/vim-startify'
Plug 'davidhalter/jedi-vim'
call plug#end()
set number
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set scrolloff=7
set mouse=a
set guicursor= 
inoremap <S-Tab> <C-d>
set list listchars=tab:>\ ,trail:+,eol:$
set whichwrap+=<,>,[,]
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Up> :split<CR>
nnoremap <silent> <C-Down> :vsplit<CR>
nnoremap <silent> <C-T> :tabe<CR>
nnoremap <silent> <C-q> :q!<CR>
nnoremap <silent> <C-s> :w<CR>
vmap <C-y> "+y
nnoremap <silent> <Space> :n<CR>
nnoremap <silent> <BackSpace> :N<CR>
nnoremap <silent> <C-f> :Files /<CR> 
nnoremap <silent> <C-x> :FloatermNew --height=0.7 --width=0.7 --wintype=float --name=floaterm1 --position=topleft<CR>
set noshowmode
set number relativenumber
command! -nargs=* W w
set complete+=kspell
set completeopt=menuone,longest
let $FZF_DEFAULT_COMMAND = 'find . -type f'
set cursorline
set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
let g:lightline = {
    \ 'colorscheme': 'tokyonight',
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
   \ }
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction