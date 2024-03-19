call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'zchee/deoplete-jedi'
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
call plug#end()

" NerdTree configuration
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F1> :NERDTree<CR>

" My other basic configuration 
set number
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set scrolloff=7
set mouse=a
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
set noshowmode
set number relativenumber
let g:deoplete#enable_at_startup = 1
set splitbelow
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
command! -nargs=* W w
set complete+=kspell
set completeopt=menuone,longest
let $FZF_DEFAULT_COMMAND = 'find . -type f'
" set cursorline  -- shows an stupid cursor line below the cursor
set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20

" Lua Configuration
lua << EOF
vim.o.background = 'dark'
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'vscode',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
require("nvim-autopairs").setup {}
EOF

" run :PlugInstall
