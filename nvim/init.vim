let config_dir = "~/.config/nvim/"

execute "source" config_dir . "/netrw.vim"
execute "source" config_dir . "/plugins/plugins.vim"

colo termcolors

" 1 tab = 4 spaces
set tabstop=4 softtabstop=0 shiftwidth=4 expandtab smarttab

" Use system clipboard
set clipboard+=unnamedplus

" Highlight cursorline
set cursorline
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Other
set number hidden nowritebackup nobackup cmdheight=2 updatetime=300

" Shortcuts
nmap <C-j> :bp<CR>
nmap <C-k> :bn<CR>
nmap <C-x> :bd<CR>
