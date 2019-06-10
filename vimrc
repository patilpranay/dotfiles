"@author - Pranay Patil

"Set indents to 2 spaces.
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

"Set autoindent.
set autoindent

"Display line numbers on the left hand side.
set number

"Ignore case when searching; /the will find both 'The' and 'the'.
set ignorecase

"Do not ignore case if upper case used; /The will find 'The' but not 'the'.
set smartcase

"Turn syntax on; needed to set a custom color scheme (e.g., solarized).
"https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
    syntax enable
endif

"Highlight the column at the 80th character.
set colorcolumn=80

"Remove trailing spaces.
function! TrimWhiteSpace()
    %s/\s\+$//e
    endfunction

    nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

"Call TrimWhiteSpace() when these events occur.
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

"Always display the status line.
set laststatus=2

"Display the full filepath in the status line.
set statusline+=%F
