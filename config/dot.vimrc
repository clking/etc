source $VIMRUNTIME/vimrc_example.vim

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set shiftwidth=4
set tabstop=8
set softtabstop=8
set cindent
set foldmethod=marker
set et
set mouse=

if $TERM == "screen"
    " set title
    set t_ts=k
    set t_fs=\
    auto BufEnter,BufRead,BufWinEnter,WinEnter * :set title | let &titlestring = '[V]' . strpart(expand('%'), 1 + strridx(expand('%'), '/'))
   " | let &titleold = strpart($SHELL, strridx($SHELL, '/') + 1)
    "auto VimLeave * :set title | let &titlestring = &titleold
endif

syn on

au BufNewFile,BufRead *.wpm setf wpm
au BufNewFile,BufRead *.c,*.cpp,*.java set cin
au BufNewFile,BufRead *.pl,*.pm set ai
au BufNewFile,BufRead *.c,*.cpp,*.java,*.pl,*.pm set path=,,..
au BufNewFile,BufRead *.css set ai
au BufNewFile,BufRead *.css set nocin
au BufNewFile,BufRead *.log set nowrap
au BufRead svn-commit* set nobackup viminfo=
au BufRead svn-prop* set nobackup viminfo=
au BufRead COMMIT_EDITMSG* set nobackup viminfo=
au BufRead *patch set nofoldenable
if maparg("<C-C>") != ""
    au TabEnter * unmap <C-C>
endif
au BufNewfile,BufRead,TabEnter *.pl,*.pm map <C-C> :w<CR>:!perl -c %<CR>
au BufNewfile,BufRead,TabEnter *.php map <C-C> :w<CR>:!php -l %<CR>

if version >= 700
  map g1 :tabn 1<CR>
  map g2 :tabn 2<CR>
  map g3 :tabn 3<CR>
  map g4 :tabn 4<CR>
  map g5 :tabn 5<CR>
  map g6 :tabn 6<CR>
  map g7 :tabn 7<CR>
  map g8 :tabn 8<CR>
  map g9 :tabn 9<CR>
  map g0 :tabn 10<CR>
  map gm1 :tabm 0<CR>
  map gm2 :tabm 1<CR>
  map gm3 :tabm 2<CR>
  map gm4 :tabm 3<CR>
  map gm5 :tabm 4<CR>
  map gm6 :tabm 5<CR>
  map gm7 :tabm 6<CR>
  map gm8 :tabm 7<CR>
  map gm9 :tabm 8<CR>
  map gm0 :tabm 9<CR>
  map gc :tabnew<CR>
  map gn :tabn<CR>
  map gp :tabp<CR>
  map <C-j> :tabn<CR>
  map <C-k> :tabp<CR>
  map <Char-0x7f> <C-h>

  imap <C-j> <Esc>:tabn<CR>
  imap <C-k> <Esc>:tabp<CR>

  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill

  au BufNewFile,BufRead *.txt,*.tex set spell
end

set bg=dark
set cursorline
set path=,,..
