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
" Custom Settings 
set number
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set scrolloff=7
set mouse=a " Enable mouse click for nvim
set guicursor= " Fix cursor replacement after closing nvim
inoremap <S-Tab> <C-d> " Shift + Tab does inverse tab
set list listchars=tab:>\ ,trail:+,eol:$ " For characters
set whichwrap+=<,>,[,] " wrap to next line when end of line is reached
nnoremap <silent> <C-Left> :tabprevious<CR> " For going on previous tab 
nnoremap <silent> <C-Right> :tabnext<CR> " For going on next tab
nnoremap <silent> <C-Up> :split<CR> " For splitting horizontally
nnoremap <silent> <C-Down> :vsplit<CR> " For splitting vertically
nnoremap <silent> <C-T> :tabe<CR> " For Creating an empty tab in vim window
nnoremap <silent> <C-q> :q!<CR> " quit vim despite of changes
nnoremap <silent> <C-s> :w<CR> " save file in vim
vmap <C-y> "+y " For copying text to clipboard (it uses vim gui application for copying buffer to clipboard)
nnoremap <silent> <Space> :n<CR> " For going forward in buffer
nnoremap <silent> <BackSpace> :N<CR> " For going back in buffer
nnoremap <silent> <C-f> :Files /<CR> " For opening all files in home directory in vim
nnoremap <silent> <C-x> :FloatermNew --height=0.7 --width=0.7 --wintype=float --name=floaterm1 --position=topleft<CR> " Small floating terminal
set noshowmode " Removing Insert Mode 
set number relativenumber " Line NO
command! -nargs=* W w
" AutoCompletion
set complete+=kspell
set completeopt=menuone,longest
" Opening Fzf in vim
" FZF including hidden files
let $FZF_DEFAULT_COMMAND = 'find . -type f'
" Customizing Cursor line and change of cursor in Insert mode
set cursorline
set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
" Tokyonight color theme
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
" Lightline Powerline theme
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
" End of Configuration file of nvim