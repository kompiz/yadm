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

" Make fancy intendations
let g:indentLine_char = '⦙'
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'


" vim-plug plugin manager
call plug#begin()
Plug 'Yggdroot/indentLine'
call plug#end()
