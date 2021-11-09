" Use ale whith coc
let g:ale_disable_lsp = 1

call plug#begin('~/.local/nvim')

" Autocompletion etc...
" Plug 'neoclide/coc.nvim'

Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

" FZF file search
Plug 'kien/ctrlp.vim'

" Show buffers 
Plug 'bling/vim-bufferline'
call plug#end()

" Show buffers in status line 
 let g:bufferline_echo = 0
    autocmd VimEnter *
      \ let &statusline='%{bufferline#refresh_status()}'
        \ .bufferline#get_status_string()

" ctrlp integrate with git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Load coc config
" execute "source" config_dir . "/plugins/coc.vim"

" Shortcuts
nmap <C-p> :CtrlP<CR>
