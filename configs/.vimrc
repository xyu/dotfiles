execute pathogen#infect()

" Make sure syntax coloring is on and we are highlighting searches
syntax enable
set hlsearch
set nowrap
set ttyfast
set background=dark
" colorscheme solarized

" Add custom syntax files
au BufNewFile,BufRead *.json set filetype=json

" Fix backspace
set backspace=2

" Use mouse scroll
if has("mouse")
    set mouse=a
endif

" Set status line
set statusline=%F%m%r%h%w%=[%l,%v][%p%%]\ [%Y]\ [%{&ff},%{strlen(&fenc)?&fenc:'none'}]
set laststatus=2

" Sets our standard tab to be tabs width 4
set noexpandtab
set tabstop=4
set shiftwidth=4

" Save all backups in common dir
set directory=~/.vim/backups//
set backupdir=~/.vim/backups//

" Turn on autoindenting
" set autoindent

" Set up php folding
set foldenable
set foldcolumn=0
set foldminlines=2
set foldlevelstart=99
set foldmethod=syntax

fun! ToggleFold()
    if foldlevel('.') == 0
        normal! l
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    " Clear status line
    echo
endfun

let php_folding = 1

" Set ctags
" set tags=/home/wpcom/public_html.tags;

" Highlight whitespace at the end of lines and tabs in files
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufWinEnter * match ExtraWhitespace /[^\t]\zs\t\+\|^\t*\zs \+\|\s\+$/

" Removes trailing spaces
function TrimWhiteSpace()
    retab!
    %s/\s*$//
    ''
endfunction

" Set some colors
:hi DiffAdd cterm=bold ctermbg=Green guibg=Green ctermfg=Black guifg=Black
:hi DiffDelete cterm=bold ctermbg=Red guibg=Red ctermfg=Black guifg=Black
:hi DiffChange cterm=bold ctermbg=Yellow guibg=Yellow ctermfg=Black guifg=Black
:hi SignColumn ctermbg=Black

:set number

" Ctrl P settings
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 1

" Copy to remote OS X
nnoremap <leader>y :call system('nc localhost 8377 -q 1', @0)<CR>

" Tab nav
noremap <leader><left> :tabprevious<CR>
noremap <leader><right> :tabnext<CR>

" No PHP Code sniff or mess detect
let g:syntastic_php_checkers = ['php']

