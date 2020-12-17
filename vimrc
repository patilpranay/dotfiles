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

"Search highlighting; use :noh to turn off highlighting until the next search
set hlsearch

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

"Turn on spell check for US English.
"set spell spelllang=en_us

"Use fzf (fuzzy finder).
set rtp+=/usr/local/opt/fzf

"Tab to switch to next open buffer
nnoremap <Tab> :bnext<cr>

"Shift + Tab to switch to previous open buffer
nnoremap <S-Tab> :bprevious<cr>

"Press leader key (default is \) twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>

"Disable custom indenter from https://github.com/leafgarland/typescript-vim
let g:typescript_indent_disable = 1

"Plugins
source /usr/local/share/gtags/gtags.vim

"Map gtags-cscope to cscope
set csprg=gtags-cscope
cs add GTAGS

"Set automatic width limit for text lines
":set textwidth=79

"Follow indentation of second line when reformatting paragraph
set fo+=2

"\s to search and replace occurrences of the current word under the cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

"Make the delete key work correctly after building Vim from source
set backspace=indent,eol,start

"Enable the Java language server
"java-language-server: https://github.com/georgewfraser/java-language-server
"vim-lsc: https://github.com/natebosch/vim-lsc
let g:lsc_server_commands = {'java': '<full-path-to-java-language-server>/java-language-server/dist/lang_server_linux.sh'}

"vim-lsc options: K to show hover
let g:lsc_auto_map = {
    \ 'ShowHover': v:true,
    \}
