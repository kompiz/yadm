" Make backspace behave as expected on MacOS
set backspace=indent,eol,start

" Make shift+enter insert line without entering insert mode (note: shift+enter sends escape sequence "[13;2u", added in iterm2)
nnoremap <S-Enter> moO<Esc>`o

" Make vim use 256 colors
set t_Co=256

" Show line numbers at bottom right
set ruler

" Make shift+spacebar insert blankspace
nnoremap <S-Space> i<Space><Esc>
" Need to figure out proper escape sequence and add to iterm2 in order to work

" Make f w also work with ctrl+left arrow and ctrl+right arrow
 map f w

" Activate syntax highlighting
syn on
set background=dark

" Make option up and down jump five lines
noremap <C-Up> 5k
noremap <C-Down> 5j

" Make yaml QOL things
set expandtab
set tabstop=2
set shiftwidth=2

" Make indentLine show whitespace
let g:indentLine_setConceal = 1
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'

" Disable json formatting and markdown formatting
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" Toggle indentLine plugin with ctrl+i
nnoremap <C-i> :IndentLinesToggle<CR>

" Toggle display of trailing whitespace
function! ToggleTrailingWhitespace()
    if !exists('w:displaying_trailing_ws')
        let w:displaying_trailing_ws = 1
        match ErrorMsg /\s\+$/
    else
        let w:displaying_trailing_ws = !w:displaying_trailing_ws
        if !w:displaying_trailing_ws
            match NONE
        else
            match ErrorMsg /\s\+$/
        endif
    endif
endfunction

nnoremap <C-s> :call ToggleTrailingWhitespace()<CR>

" Toggle display line numbers on and off
function! ToggleLineNumbers()
    if &number
        set nonumber
    else
        set number
    endif
endfunction

nnoremap <C-l> :call ToggleLineNumbers()<CR>
