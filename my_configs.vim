" Reload vimrc on change
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


""""""""""""""""""""""""""""""""""""""""
" Molokai color scheme
""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

"""""""""""""""""""""""""""
" MiniBufExpl Colors
"""""""""""""""""""""""""""
set t_Co=256 "iterm supports 256 colors
hi MBENormal               ctermfg=239     ""  ctermbg=
hi MBEChanged              ctermfg=196     ""  ctermbg=
hi MBEVisibleNormal        ctermfg=33      ""  ctermbg=
hi MBEVisibleChanged       ctermfg=196     ""  ctermbg=
hi MBEVisibleActiveNormal  ctermfg=70      ""  ctermbg=
hi MBEVisibleActiveChanged ctermfg=015         ctermbg=088

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSBeautify, CSSBeautify, HtmlBeautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

""""""""""""""""""""""""""""""
" Numbers.vim key mappings
""""""""""""""""""""""""""""""
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F2> :NumbersOnOff<CR>



""""""""""""""""""""""""""""""
" Latex-Suite
""""""""""""""""""""""""""""""
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" Set line with to 72 for latex files
" "autocmd FileType tex    set textwidth=72

"""""""""""""""""""""""""""""
" Show eol character
"""""""""""""""""""""""""""""
set listchars=eol:¬
set listchars=nbsp:¬,eol:¬,tab:›-,extends:»,precedes:«,trail:⸰
highlight SpecialCharacter ctermfg=5
set list

""""""""""""""""""""""""""""""""""""""""
" Enhanced increment / decrement
""""""""""""""""""""""""""""""""""""""""
function! AddSubtract(char, back)
    let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
    call search(pattern, 'cw' . a:back)
    execute 'normal! ' . v:count1 . a:char
    silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent>         <C-b> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-b> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To stop indenting when pasting with the mouse
" Try hitting F5 key in insert mode (or just :set paste)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F5>


""""""""""""""""""""""""""""""""""""""""""
" Chuck Programming language
""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ck setf ck

""""""""""""""""""""""""""""""""""""""""
" Scala import grouping
""""""""""""""""""""""""""""""""""""""""
let g:scala_sort_accross_groups=1



"""""""""""""""""""""""""""""""""""""""""""""
" Scalariform command for use with vim
" Scalariform is a code formatter for scala
"""""""""""""""""""""""""""""""""""""""""""""
" au BufEnter *.scala setl formatprg=~/.scalariform/scalariform\ -f\ -q\ +alignParameters\ --stdin\ --stdout
au BufEnter *.scala setl formatprg=scalariform\ -f\ -q\ +compactControlReadability\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +preserveSpaceBeforeArguments\ --stdin\ --stdout


:au VimEnter * au FileType * if !exists('b:match_words')
                \ | let b:match_words = &matchpairs | endif


""""""""""""""""""""""""""""""""""""""""""""
" Wrap text to 90 lines in latex
""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.tex setlocal textwidth=90

"""""""""""""""""""""""""""
" Easy motion vim config
"""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" jump to anywhere you want with minimal keystrokes, with just one key binding
" s{char}{label}
nmap s <Plug>(easymotion-s)
" or
" s{char}{char}{label}
" Need one more keystroke, but on average, it may be more comfortable
" "nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions
map <Leaders>j <Plug>(easymotion-j)
map <Leaders>k <Plug>(easymotion-k)

"""""""""""""""""
" Ctags shortcut
"""""""""""""""""
set tags=tags,./tags; " By default vim will only look for the tags in the dir of the file
                      " open in the current buffer. This will make vim move up the dir
                      " hierarchy until it has found the file.

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"ctags -R --exclude=target --exclude=vendor

" To find for tags put the cursor on the word
" and hit tt
nmap tt <c-]>:tselect<cr>

""""""""""""""""""""""""""""""""""""
" Movement between tabs OR buffers
""""""""""""""""""""""""""""""""""""
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction


" Disable syntastic for java
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js', 'py'], 'passive_filetypes': ['java','sbt','html'] }


if has("gui_running")
    "set guifont=Menlo:h14
     set guifont=Monaco:h12
    "set guifont=LetterGothic:h14
    highlight Comment gui=italic
    colorscheme solarized
    set background=dark
endif

set nu
set mouse=a

"Disable bells and flashing
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Copy paste from clipboard to vim and vice versa
set clipboard=unnamed

" Buffer resizing

" Easy window split movement - instead of <c-w> j use <c-j>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" CtrlP mapping
""""""""""""""""""
nnoremap <Leader>p :CtrlP<CR>

