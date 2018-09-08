"Template .vimrc                                                    vim:ts=3 sw=3
set guifont=Monospace\ 9  "set the guifont to Monospace. Linux screws up the default text type
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
"set backupdir=~/tmp	" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set number
set laststatus=2	" always show status bar, even if it is last file
set smartindent		" C-intelligent indenting
"set location for swap files - I don't like them in the current directory
set directory=$HOME/.vim,/tmp
"set nowrapscan		" Don't search from the top of the file if you cant find
set wrap		" Don't let text run off screen
set backspace=2		" Don't limit insert backspace to where insert began
set ignorecase		" Ignore case on searches
set smartcase		" Treat mixed-case as an exact search - overrides ignore

set showcmd		" Show commands as they are typed, in lower right corner
set keywordprg=grep	" Program to invoke with 'K' command
set grepprg=grep\ -n	" Program to invoke with :grep command
set grepformat=%f:%l:%m " grep parsing
set tabstop=3		" tabstop
set shiftwidth=3		" shiftwidth
set whichwrap=<,>,[,],h,l,s,b " Allow cursor to move between lines freely
set winheight=10	" Minimum number of lines in active window
set expandtab		" Fill tabs with spaces
"set switchbuf=split     " When requesting a window that is open, jump to open
set winminheight=0      " Make windows squishy small
set noequalalways       " Prevent windows from resizing on changes
set cmdheight=1         " The command section should be 1 high
set lcs=tab:>-,trail:-  " listchar options: how to show tabs and eol
set mousehide           " hide the mouse when typing occurs
set nosplitbelow        " open new windows above current window
set makeprg=gmake       " Use gmake instead of make
set ignorecase
set incsearch
set wrapscan 
set hlsearch            " Highlight search hits
if v:version >= 600
set sessionoptions=buffers,winsize,winpos,resize,curdir "what to save with :mks
else
set sessionoptions=buffers,winsize,winpos,resize "what to save with :mks
endif
"set visualbell          " Don't ding
set tagrelative
set tags=./tags,tags,../tags

"Set colorsheme
"colorscheme desert
"colorscheme elflord
"colorscheme murphy

let g:explVertical=1	" Split vertically
"#set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Used by taglist.vim
let Tlist_Ctags_Cmd = 'c:\util\ctags.exe'
"Open tag list
let Tlist_Key = '\t'
"Force quick tag info on name under cursor
let Tlist_Sync_Key = '\h'
"Tag list order 'name' or 'order'
let Tlist_Sort_Type = "name"
"Refresh tag window for each file opened
let Tlist_Auto_Refresh = 1

" Turn on Syntax Highlighting
syntax enable


"##############################################################################
"#     Mappings                                                               #
"##############################################################################
"I hate hitting backspace with shift and getting <S-Del>
imap <S-Del> <BS>
cmap <S-Del> <BS>

map <C-N> :cn<CR>
map <C-P> :cp<CR>

map <C-J> <C-E>j
map <C-K> <C-Y>k

" Don't use Ex mode, use Q for formatting
map Q gq

"Windows commands
"Make all windows equal in size
map z= <C-W>=
"Make current window as large as possible
map zb <C-W>_
"Move between windows
map zj <C-W>w
map z<Down> <C-W>w
map zk <C-W>W
map z<Up> <C-W>W
"Jump to previous window
map zp <C-W><C-P>
"Jump to top window
map zt <C-W>t
"Jump to bottom window
map zg <C-W>b
"Move to left window
map zh <C-W>h
map z<Left> <C-W>h
"Move to right window
map zl <C-W>l
map z<Right> <C-W>l

"Open a new window on the file under the cursor
map zf :sp \| call OpenFile()<CR>
map gf :call OpenFile()<CR>

"Move the current window up or down.  Use g:num_windows to find bottom window
map zzk :call MoveWinUp()<CR>
map zzh :call MoveWinLeft()<CR>
map zzj :let g:num_windows = 0<CR>:call MoveWinDown()<CR>
map zz<Up> zzk
map zz<Down> zzj

"Quick quit on a file with confirm message
map <C-X> :confirm q<CR><C-L>
imap <C-X> <C-O><C-X>
noremap <C-Z> <C-X>

"I hate pressing K for up when caps lock is on!
map gk :if &modified==1:sp:endif:let homedir=getcwd()<CR>:cd %:p:h<CR>:grep <cword> *.c *.h<CR>:exe 'cd ' homedir<CR>
map K k

"Search for highlighted selection
vmap * y:let @@=escape(@@, '^$\/[].*')<CR>:let @@=substitute(@@,"","","")<CR>/<C-R>"<CR>
vmap z] y:call OpenTag("<C-R>0", 0)<CR>
vmap  y:call OpenTag("<C-R>0", 0)<CR>

map z] :call OpenTag(expand("<cword>"), 1)<CR>
map  :call OpenTag(expand("<cword>"), 0)<CR>


"##############################################################################
"#  End Mappings                                                              #
"##############################################################################


"##############################################################################
"#  Custom Functions                                                          #
"##############################################################################
function! MoveWinUp()
  if winnr() == 1
    exe "normal R"
  else
    exe "normal W".winnr()."x"
  endif
endfunction

"g:num_windows is a weird way to figure out how many windows we have
let g:num_windows = 0
function! MoveWinDown()
  if winnr() == g:num_windows
    exe "normal r"
  else
    exe "normal w".winnr()."x"
  endif
endfunction

function! MoveWinLeft()
    exe "normal h".winnr()."x"
endfunction

" Open a file.  If the name is followed by :[number], open to that line number
function! OpenFile()
  exe "normal \"9Y"
  let tmp=matchstr(@9, ":[0-9][0-9]*")
  "let filename=matchstr(expand("<cfile>"), "[^:]*")
  let filename=expand("<cfile>")
  if (tmp != "")
     "We have a file with a line number
     let filename=substitute(filename, ":[0-9][0-9]*", "", "")
     let tmp=substitute(tmp, ":", "", "")
     let tmp=tmp . "G"
     echo "We have file " . filename . " line number " . tmp
  endif
  exe "find " . filename
  exe "normal ".tmp.""
endfunction

"Pad filenames for the status line so that all current directories line up
function! STLFile()
   let title=expand("%:~:.:h")
   if title == ""
      let title = "." . title
   else
      let len = strlen(title)
      if len > 39
         let title = "<" . strpart(title, len - 39, 39)
      endif
   endif

   if winnr() > g:num_windows
      let g:num_windows=winnr()
   endif
   return title
endfunction

function! RunTkcvs()
  let olddir = getcwd()
  let newdir = expand("%:h")
  execute("cd ".newdir)
  execute("!tkcvs&")
  "call system("tkcvs &")
  execute("cd ".olddir)
endfunction

function! DiffTwoWins()
  if (&modified || !filereadable(@%))
     exec "!echo ".@%."  not written to disk> ${HOME}/tmp/a"
     exec "w >>${HOME}/tmp/a"
     let &modified = 1
     let file1 = "${HOME}/tmp/a" 
  else
     let file1 = expand("%")
  endif
  exe "normal p"
  if (&modified || !filereadable(@%))
     exec "!echo ".@%."  not written to disk> ${HOME}/tmp/b"
     exec "w >>${HOME}/tmp/b"
     let &modified = 1
     let file2 = "${HOME}/tmp/b" 
  else
     let file2 = expand("%")
  endif
  exe "normal p"
  call system("tkdiff ".file1." ".file2)
endfunction

function! OpenTag(tag_id,do_split)
  if has("cscope")
     if (&modified) || a:do_split == 1
        exe "sta ".a:tag_id
     else
        exec "ta ".a:tag_id
     endif
  else
     if (&modified) || a:do_split == 1
        exe "sts ".a:tag_id
     else
        exec "ts ".a:tag_id
     endif
  endif
endfunction

"##############################################################################
"#  End of Common Functions                                                   #
"##############################################################################

 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,:// | set si cinkeys=0{,0},:,0#,!^F,o,O,e
  "autocmd FileType c,cpp  map [[ 100[{| map ]] 100]}
"  set errorformat=%f:%l:\ %m,%Dgmake[%*\d]:\ Entering\ directory\ `%f',%Dgmake[%*\d]:\ Leaving\ directory\ `%f'
 augroup END

 "Change window title according to current file
 auto BufEnter * let &titlestring = expand("%:p")
 "auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")

"Setup cscope if compiled in
if has("cscope")
	set csprg=cscope
	set csto=0
	set cst
	set nocsverb
	"This adds the cscope database
	"if filereadable("cscope.out")
		cs add cscope.out
endif

"
" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
"
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab

" Cscope support through cscope_cli
function! Cscope_list(symbol, keyword)
	let s:pre_grp_fm=$gfm
	let s:pre_grp=$grepprg
	copen
	set grepprg=cscope_cli
	set gfm=%f\ %*[^\ ]\ %l%m
	exe ":grep " . a:symbol " " . a:keyword
	set gfm=s:pre_grp_fm
	set grepprg=s:pre_grp
endfunction
command! -nargs=* Cscope call Cscope_list(<f-args>)
map <C-_> :Cscope s <C-R>=expand("<cword>")<CR><CR>
" End cscope_cli


set history=1000	" Number of : commands to remember
set splitbelow          " open new windows below current window
"set visualbell          " Don't ding
"No toolbar (T is omitted)
set guioptions=igmrLta

"set statusline=%1*%{winnr()}%0*\ %<%-f%h%m%r%=%l\ %P
"set statusline=%=%<%h%w\ %f%15(%M%R%W%5l\ %P%)\ %1*%2{winnr()}%0*
"set statusline=%40{STLFile(@%)}%=%-20t%<%h%w\ %15(%M%R%W%5l\ %P%)\ %1*%2{winnr()}%0*
"set statusline=%2*%40{expand(\"%:~:.:h\")}/%0*%=%-18t%<%h%w\ %12(%M%R%W%5l\ %P%)\ %1*%2{winnr()}%0*
"set statusline=%40{STLFile()}%2*/%0*%-t%h%m%r%w%=%W%5l\ %P\ %2*%2{winnr()}%0*
" END MY SETTINGS

" MY MAPPINGS

"Screen lock scrolling - use C-J and C-K to move screen without moving cursor
map <C-J> j<C-E>
map <C-K> k<C-Y>

" Center searches to middle of screen
noremap n nzzlh
noremap N Nzzlh

" gd   Change directory to that of file under cursor.
map gd :call Change_dir()<CR>

" Open file in new window
map gF :sp \| call OpenFile()<CR>

map g[ [([([([([([([([(

map <C-MiddleMouse> :if match(@*, ":sn ")!=-1\|exe "normal @*"\|let @*=""\|else\|let @*=":sn " . expand("%:p")\|echo "Filename <C-R>% captured"\|:endif<CR>

"map zc ^"9y$$F/l"8y$:let tempfile=tempname() . "__" . @8<CR>:exe "!cvs co -p " . @9 . " >" . tempfile<CR>:exe "sn " . tempfile<CR>:exe "!rm " . tempfile<CR>:unlet tempfile<CR><CR>
"map zc ^"9y$$F/l"8y$:let @7=@8<CR>:if filereadable(@8)<CR>:let @8=tempname(). "__" . @8<CR>:endif<CR>:sn <C-R>8<CR>!!cvs co -p <C-R>9<CR>1G5dd:set nomodified<CR>

"Special block paste (replace paste instead of insert paste
map gp mzgv:let x1=col(".")
:let y1=line(".")
gvo:let x2=col(".")
:let y2=line(".")
:let x1=x2-x1
:let y1=y2-y1
:if x1 < 0\|let x1 = x1 * -1\|endif
:if y1 < 0\|let y1 = y1 * -1\|endif
:let @p="".x1."l".y1."j\"_dP"
:if y1 == 0\|let @p="".x1."l"."\"_dP"\|endif
:if x1 == 0\|let @p="".y1."j\"_dP"\|endif
:unlet x1
:unlet y1
:unlet x2
:unlet y2
`z@p
"End of block paste

"Various comments for highlighted blocks
"Perl Comments
vmap cp !boxes -t <C-R>=&ts<CR> -d pound-cmt<CR>
vmap up !boxes -r -t <C-R>=&ts<CR> -d pound-cmt<CR>

"C comments
vmap cc !boxes -t <C-R>=&ts<CR> -d c-cmt2<CR>
vmap cC !boxes -t <C-R>=&ts<CR> -s 78<CR><CR>
vmap uc !boxes -r -t <C-R>=&ts<CR> -d c-cmt2<CR>
vmap uC !boxes -r -t <C-R>=&ts<CR><CR>

" END MY MAPPINGS

" Diff buffers a & b
if (v:version >= 600)
	map <S-F6> :newiBuffer_A<ESC>"ap:w! /tmp/a:q:newiBuffer_B<ESC>"bp:w! /tmp/b:vert diffsplit /tmp/a
else
	map <S-F6> :new
	iBuffer_A<ESC>"ap:w! /tmp/a
	:q
	:new
	iBuffer_B<ESC>"bp:w! /tmp/b
	:q
	:!wdiff /tmp/a /tmp/b >/tmp/ab
	:!gvim -c "set ft=wd" /tmp/ab

endif

"Get filename and line number
map <F9> :call GetFileAndNum()<CR>
imap <F9> <F9>

let hw_image = "ssr/bin/hw/ssr_main/rlse/ssr_main"
vmap <F9> yo<Esc>!!addr2line -e <C-R>=hw_image<CR> <C-R>0<CR><CR>

map <F10> nkdd
map <F11> ^y$:!cvs co <C-R>0<CR>
map <F12> n.
 
" Mapping to allow quick directory open
cmap  sn %

"map <Help> <Esc>
"imap <Help> <Esc>

" END MY FUNCTIONS KEYS

amenu 60.9 &Buffers.&Filename\ to\ Clipboard  :let @*=expand("%:p")<CR>
amenu 60.10 &Buffers.&Open\ from\ Clipboard   :sn <C-R>*<CR>

" MY FUNCTIONS

" Save the filename and the line number in register 0
function! GetFileAndNum()
   let @0=@%.":".line(".")
   echo @0
   let @"=@0."\n"
   let @0=@0
endfunction

function! Change_dir()
  let newdir = expand("%:h")
  if newdir == ""
    execute("cd -")
  else
    execute("cd ".newdir)
 endif
  execute ("pwd")
endfunction

function! CloseDuplicateWins()
   "Save current window number
   "Cycle through window numbers, saving buffer numbers associated
   let orig_buf=winbufnr(winnr())
   let curr_win = 1
   let all_wins=" "
   while winbufnr(curr_win) != -1
      "If a buffer number appears in the saved list, close the window
      if match(all_wins, " ".winbufnr(curr_win)." ") != -1
         "Close the window
         exe "normal ".curr_win."Wc"
      else
         "Add the window to the list
         let all_wins = all_wins . " ". winbufnr(curr_win) . " "
         let curr_win = curr_win + 1
      endif
   endwhile
   exe "normal ".(bufwinnr(orig_buf))."W"
endfunction
command! -nargs=* Clean call CloseDuplicateWins()

function! DiffSetup()
   set co=185
   set lines=40
   exe "normal ="
   exe "normal "
   exe "normal Go0idiff the end of diffs1G"
endfunction

function! DiffDelete()
   let @8=@/
   exe "normal $?^diff\\|^Only\\|^Binary"
   exe "normal d/^diff\\|^Only\\|^Binary"
   call histdel("/", -1)
   let @/=histget("/", -1)
   let @/=@9
endfunction

function! DiffCopyLeft()
   let @9=@/
   exe "normal $?^diff\\|^Only\\|^Binary"
   exe "normal 0w\"9y$"
   echo "Copy Left to Right? (y/n) ".@9 
   let choice = 0
   while choice != 121 && choice != 110
        let choice = getchar()
   endwhile
   if choice != 121
           echo "Canceled ".choice
           return
   endif
   exe "normal :!c:\\util\\cp 9"
   call histdel("/", -1)
   let @/=histget("/", -1)
   let @/=@9
   exe "normal A copy ->"
endfunction

function! DiffCopyRight()
   let @9=@/
   exe "normal $?^diff\\|^Only\\|^Binary"
   exe "normal 0w\"8yf f w\"9y$"
   echo "Copy Right to Left? (y/n) ".@9." ".@8 
   let choice = 0
   while choice != 121 && choice != 110
        let choice = getchar()
   endwhile
   if choice != 121
           echo "Canceled ".choice
           return
   endif
   exe "normal :!c:\\util\\cp 9 8"
   call histdel("/", -1)
   let @/=histget("/", -1)
   let @/=@9
   exe "normal A copy <-"
endfunction

function! DiffReDiff()
   let @9=@/
   exe "normal $?^diff"
   exe "normal $F \"8y$F \"7yf "
   let @6=":sn 8 \| vert diffsplit 7"
   exe "normal @6"
   call histdel("/", -1)
   let @/=histget("/", -1)
   let @/=@9
endfunction

" END MY FUNCTIONS

 augroup diff
 "Special diff file commands
  autocmd FileType diff  %s/^diff.*-[^ ] */diff / | set buftype=nowrite | 1
\ | map <F1> :call DiffDelete()<CR>
\ | map <F2> 0"9y$:let @9=substitute(@9, "^diff ", ":!tkdiff ", "") . "\n " <CR>@9 
\ | map <F3> :call DiffReDiff()<CR>
\ | map <F4> :call DiffCopyLeft()<CR>
\ | map <F5> :call DiffCopyRight()<CR>
\ | map <C-N> /^diff\\|^Only\\|^Binaryz^
\ | map <C-P> ?^diff\\|^Only\\|^Binaryz

if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif

  autocmd BufRead out set buftype=nowrite
endif

if has("gui_running")
  "amenu 10.519 &File.&PrintSmall	:w !enscript -fCourier6 -2 -t 2<CR>
  "vmenu 10.519 &File.&PrintSmall	:w !enscript -fCourier6 -2 -t 2<CR>
  amenu 10.519 &File.&PrintSmall	:w !enscript -2r -P f1-007 <CR>
  vmenu 10.519 &File.&PrintSmall	:w !enscript -2r -P f1-007 <CR>
  " Replace lpr commands
  amenu 10.510 &File.&Print			:w !enscript -Pf1-007 <CR>
  vunmenu &File.&Print
  vmenu &File.&Print				:w !enscript -Pf1-007 <CR>
endif


"##############################################################################
"#     Compiler specifics                                                     #
"##############################################################################
map <F7> :exe "make"<CR> \| copen \| cc
imap <F7> :exe "make ".g:makefile <CR> \| copen \| cc

set makeprg=make
"set makeprg=redir\ -eo\ make
"set makeprg=redir\ -eo\ gcc\ -I.\ -I\ ../MainCommon\ -I../../CMCommon\ -I/\ C:/cygwin/usr/include\ -I../MIOCommon\ -c\ -o\ PMAdi.o\ PMAdi.c
set makeprg=gmake

map <F7> :exe "make"<CR> \| copen \| cc
imap <F7> :exe "make "<CR> \| copen \| cc

set autowrite
let makefile="Makefile"
"GCC
set efm=%f:%l:\ %m,%Dgmake[%*\\d]:\ Entering\ directory\ `%f',%Dgmake[%*\\d]:\ Leaving\ directory\ `%f'

nmap <C-n> :bn<CR>
nmap <C-b> :bp<CR>
nmap <C-s> :wa<CR>

" Clearcase Macros
map <F8> :!ct co -unr -nc %<CR>
map <F9> :!ct diff -pred -diff  % \| less<CR> 
map <F10> :!ct ci %<CR>
set list
set cscopetag cscopeverbose
if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
endif


