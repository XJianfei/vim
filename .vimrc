"ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .
syntax enable
syntax on
set ru
set hls
"set sw=4
"set ts=4
"set spell
set lbr
"set sm
set cin
"set cino=:0g0t0(sus
"显示行号 
set number
"检测文件的类型 
filetype on 
"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch 
"在编辑过程中，在右下角显示光标位置的状态行 
set ruler 
"set autoindent cindent cinoptions=g0
"mouse
set mouse=
"Set to auto read when a file is changed from the outside
set autoread
"Auto save file, when go to other file
set aw
"Set screen columns
"set co=80
"Enable filetype plugin
filetype plugin on
filetype indent on
"Sets how many lines of history VIM har to remember
set history=100
"Highlight current
"if has("gui_running")
"	set cursorline
"   hi cursorline guibg=#333333
"	hi CursorColumn guibg=#333333
"endif
"Set 7 lines to the curors - when moving vertical..
set so=7
"Turn on WiLd menu
set wildmenu

set fileformats=unix

"The commandbar
set cmdheight=1

"Show line number
set nu
"Highlight search things
set hlsearch
"enable folding, I find it very useful
set nofen
set fdl=0

"set formatoptions+=tcqn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shiftwidth=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=


"不兼容Vi
set nocp
"设置光标在行首时按退格键，光标会回到上一行行尾
set backspace=indent,eol,start
"不生成备份文件
set nobackup
"fonts size
if has("gui_running")
  colo desert
  "  set gfn =Nimbus\ Roman\ 12
  set gfn=Bitstream\ Vera\ Sans\ Mono\ 12 
else
  "  colo winter 
endif

"colorscheme biogoo
"set background=dark
"colorscheme morning 



"minibuf
let g:miniBufExpMapWindowNavVim=1
let g:miniBufExpMapWindowNavArrows=1
let g:miniBufExpMapCTabSwitchBufs=1
let g:miniBufExpModSelTarget=1
nmap \mb :TMiniBufExplorer<cr>

"Tlist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
"WM
let g:winManagerWindowLayout='FileExplorer|TagList'
"自动补全
filetype plugin indent on
set completeopt=longest,menu

set foldmethod=syntax
set foldlevel=100 " 启动vim时不要自动折叠代码
"Tab
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


" mapping
" 如果下拉菜单弹出，回车映射为接受当前所选项目，否则，仍映射为回车；
"
" 如果下拉菜单弹出，CTRL-J映射为在下拉菜单中向下翻页。否则映射为CTRL-X CTRL-O；
"
" 如果下拉菜单弹出，CTRL-K映射为在下拉菜单中向上翻页，否则仍映射为CTRL-K；
"
" 如果下拉菜单弹出，CTRL-U映射为CTRL-E，即停止补全，否则，仍映射为CTRL-U；



"此命令用于查看所有的编译错误.
"                 此命令用于查看当前的编译错误.
" 此命令用于跳到下一个出错位置.                 
"此命令用于跳到上一个出错位置.                



let g:NeoComplCache_EnableAtStartup = 1 
"
"set 全能补全
set nocp
filetype plugin on
filetype indent on
"set tags+=./tags
"set tags+=/home/xjf/exercise/apue/tags
"set tags+=/home/xjf/appsrc/tags/tags
"set tags+=/home/xjf/appsrc/tags/sometags/tags
"au BufWritePost *.c,*.cpp,*.cc,*.h !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
"C++ class
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_SelectFirstItem = 2


let OmniCpp_GlobalScopeSearch = 1 
let OmniCpp_NamespaceSearch = 1  
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
"end C++
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_NamespaceSearce = 1
"let OmniCpp_DisplayMode = 0
"let OmniCpp_ShowScopeInAbbr = 0
"
":if getfsize(".vimscript")>0
"        source .vimscript       
":endif

set laststatus=1
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行； 
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编 
set autoindent 
set smartindent 
" Use space replace tab
set expandtab
"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格 
set tabstop=4 
set shiftwidth=4 
"set softtabstop=4
"








"auto update tags when write file
function! DelTagOfFile(file)
	let fullpath = a:file
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let f = substitute(fullpath, cwd . "/", "", "")
	let f = escape(f, './')
	let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
	let resp = system(cmd)
endfunction

function! UpdateTags()
	let f = expand("%:p")
	let cwd = getcwd()
	let tagfilename = cwd . "/tags"
	let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+ialS --extra=+q ' . '"' . f . '"'
	call DelTagOfFile(f)
	let resp = system(cmd)
endfunction

cnoremap autotags autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()



"autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()
"


"javacomplete
"set omnifunc=javacomplete#Complete
"或者，使用autocmd: >
" 所用的Vim版本必须包含autocommands特性。
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd FileType java set completefunc=javacomplete#CompleteParamsInf
autocmd FileType c set expandtab
autocmd FileType java set expandtab



"iunmap <c-k>
"imap <c-k> <up>
"imap <c-j> <down>
"imap <c-h> <left>
"imap <c-l> <right>

"set nocompatible
"set backspace=indent,eol,start


"audo complete





"get last delete. do "u.u." until found



set tsl=10000
" color
color desert2

"do_inoremap


" inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"a
"inoremap <expr> <cr>       pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
"inoremap <expr> <c-n>      pumvisible() ? "\<c-n>" : "\<c-n>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
"inoremap <expr> <m-;>      pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
"inoremap <Tab> <Tab>     
inoremap incl<Tab> #include "
inoremap inclc<Tab> #include "
inoremap inc<Tab> #include <
inoremap main<tab> int main(int argc, char **argv)<nl>{<nl>}<esc>O
inoremap de<tab> #define 
"inoremap <cr> <cr>
inoremap hack<tab>	/* @xiong */<esc>0lllli
inoremap hacke<tab> /* #xiong */<esc>0lllli
nmap <leader>ahk  o<esc>\cA added by cvte_peter <esc>
nmap <leader>ahe  o<esc>\cA end by cvte_peter <esc>
nmap <leader>mhk  o<esc>\cA modified by cvte_peter <esc>
nmap <leader>mhe  o/* end@xiongjianfei */<esc>
nmap <leader>xgd  ixiongjianfei <c-r>=strftime("%Y-%m-%d")<cr><esc>
nmap <leader>gd   i<c-r>=strftime("%Y-%m-%d")<cr><esc>
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
"autocmd FileType java inoremap <buffer> . .<C-X><C-O><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  A  A<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  B  B<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  C  C<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  D  D<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  E  E<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  F  F<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  G  G<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  H  H<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  I  I<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  J  J<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  K  K<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  L  L<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  M  M<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  N  N<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  O  O<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  P  P<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Q  Q<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  R  R<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  S  S<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  T  T<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  U  U<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  V  V<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  W  W<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  X  X<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Y  Y<C-N><C-P>
"autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Z  Z<C-N><C-P>
"inoremap /* /*  */<esc>hhi
"inoremap _ _<C-X><C-N>
"inoremap <buffer>  A  A<C-N><C-P>
"inoremap <buffer>  B  B<C-N><C-P>
"inoremap <buffer>  C  C<C-N><C-P>
"inoremap <buffer>  D  D<C-N><C-P>
"inoremap <buffer>  E  E<C-N><C-P>
"inoremap <buffer>  F  F<C-N><C-P>
"inoremap <buffer>  G  G<C-N><C-P>
"inoremap <buffer>  H  H<C-N><C-P>
"inoremap <buffer>  I  I<C-N><C-P>
"inoremap <buffer>  J  J<C-N><C-P>
"inoremap <buffer>  K  K<C-N><C-P>
"inoremap <buffer>  L  L<C-N><C-P>
"inoremap <buffer>  M  M<C-N><C-P>
"inoremap <buffer>  N  N<C-N><C-P>
"inoremap <buffer>  O  O<C-N><C-P>
"inoremap <buffer>  P  P<C-N><C-P>
"inoremap <buffer>  Q  Q<C-N><C-P>
"inoremap <buffer>  R  R<C-N><C-P>
"inoremap <buffer>  S  S<C-N><C-P>
"inoremap <buffer>  T  T<C-N><C-P>
"inoremap <buffer>  U  U<C-N><C-P>
"inoremap <buffer>  V  V<C-N><C-P>
"inoremap <buffer>  W  W<C-N><C-P>
"inoremap <buffer>  X  X<C-N><C-P>
"inoremap <buffer>  Y  Y<C-N><C-P>
"inoremap <buffer>  Z  Z<C-N><C-P>
inoremap lol<tab> LOGD("%s: %d\n", __func__, __LINE__);
inoremap pfl<tab> printf("%s: %d\n", __func__, __LINE__);
inoremap pkl<tab> printk("%s: %d\n", __func__, __LINE__);
"inoremap <c-k> <up>
"inoremap <c-j> <down>
"inoremap <c-l> <right>
"inoremap <c-m> <left>
inoremap cc<tab> /*  */<left><left><left>
inoremap ccc<tab> /** */<left><left><left>
inoremap <c-k> <esc>0i

inoremap <c-t> <c-x><c-]>


" _nmap


nmap <leader>msa :set mouse=a<cr>
nmap <leader>mse :set mouse=<cr>
nmap tl :Tlist<cr>
nmap tn :NERDTreeToggle<cr>
nmap twm :NERDTree<cr>:Tlist<CR>
"nmap wm :WMToggle<cr>
":nmap <F5> :cl<CR>  
":mmap <F5> <ESC><F5>  :nmap <F6> :cc<CR> 
":mmap <F6> <ESC><F6>  :nmap <F7> :cn<CR>   
":imap <F7> <ESC><F7>  :nmap <F8> :cp<CR>
nmap qqq :qa!<cr>
nmap qs :q!<cr>
nmap zzz :w<cr>
nmap ccc :wqa<cr>
nmap make :make<cr>
nmap <C-\> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>:set tags+=tags<cr>
nmap # /\<<c-r><c-w>\><cr>
nmap qw <c-w>
nmap qb :b
nmap addx<tab>	i/* Added by xjf */
nmap modx<tab>	i/* Modified by xjf */
nmap addxjf<tab> i/* Added by xjf */<cr>/* End of adding by xjf */
nmap ts		:ts <c-r><c-w><cr>
nmap hack<tab>	i/* @xiong */<esc>0lllli
nmap hacke<tab> i/* #xiong */<esc>0lllli
nmap <leader>ut :call UpdateTags()<cr>
nmap <leader>addlinux :set tags+=~/bin/linux_tags<cr>
nmap <leader>tl :set tags+=~/bin/linux_tags<cr>
nmap <leader>addblibc :set tags+=~/bin/blibc_tags<cr>
nmap <leader>tb :set tags+=~/bin/blibc_tags<cr>
nmap <leader>addfw :set tags+=~/bin/android_fw_tags<cr>
nmap <leader>tfw :set tags+=~/bin/android_fw_tags<cr>
nmap gp "1p  
nmap gP "1P

" command

" delete space or tab beginning of the line
nmap <leader>dbl    :s/^\s\+//g<cr>
nmap <leader>del    :s/\s\+$//g<cr>

"set ignorecase

"nmap <c-m> :se<c-r>=GetChar()

"nmap <leader>ams  o/* <c-r>=strftime("%Y-%m-%d")<cr>, added by cvte_peter @{ */<esc>
"nmap <leader>ame  o/* end by cvte_peter @} */<esc>
" mid code comment
nmap <leader>as  <esc>$a<tab>// added by cvte_peter
nmap <leader>ms  <esc>$a<tab>// modified by cvte_peter
nmap <leader>ams  o/* <c-r>=strftime("%Y-%m-%d")<cr>, cvte_peter @{ */<esc>
nmap <leader>ame  o/* @} */<esc>
nmap <leader>mms  o/* <c-r>=strftime("%Y-%m-%d")<cr>, modified by cvte_peter @{ */<esc>
nmap <leader>cms  o/* commented by cvte_peter @{ */<esc>
nmap <leader>mme  o/* end by cvte_peter  @}*/<esc>
nmap <leader>tag   <esc>a<tab>/* cvte_peter */<esc>
nmap <leader>xjf  o<c-r>=strftime("%Y-%m-%d")<cr>, cvte_peter @{<esc>\c<space>
nmap <leader>xe   o<c-r> @}<esc>\c<space>

nmap <leader>msp    <esc>a<tab>// [patch] ,cvte_peter, <c-r>=strftime("%Y-%m-%d")<cr> <esc>F]
nmap <leader>msb    <esc>a<tab>// [bug] ,cvte_peter, <c-r>=strftime("%Y-%m-%d")<cr> <esc>F]
nmap <leader>msf    <esc>a<tab>// [feature] ,cvte_peter, <c-r>=strftime("%Y-%m-%d")<cr> <esc>F]

nmap <leader>mmp    <esc>o/* [patch]<cr>cvte_peter, <c-r>=strftime("%Y-%m-%d")<cr><cr>---start*/<esc>
nmap <leader>mmb    <esc>o/* [bug]<cr>bugid:<cr>cvte_peter, <c-r>=strftime("%Y-%m-%d")<cr><cr>---start*/<esc>
nmap <leader>mmf    <esc>o/* [feature]<cr>cvte_peter, <c-r>=strftime("%Y-%m-%d")<cr><cr>---start*/<esc>
"nmap <leader>mme    <esc>o/* ---end */<esc>

function! GetChar()
    let g_c = getchar()
    "return nr2char(getchar())
    return g_c
endfunction


if !exists("my_auto_commands_loaded")
    let my_auto_commands_loaded = 1
    "not open 300M?
    let g:LargeFile = 300 * 1024 * 1024
    augroup LargeFile
        autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
endif

nmap <leader>tagpxak <esc>:set tags+=/home/xjf/bin/pxa_kernel_tags<cr>
nmap <leader>jtrace <esc>oRuntimeException here = new RuntimeException("here");<cr>here.fillInStackTrace();<cr>Log.w(TAG, "Called: " + this, here);<esc>


" Ack, grep, find
nmap <leader>ack :Ack 
nmap <leader>ackc :Ack --cc --cpp
nmap <leader>ackh :Ack --h
nmap <leader>ackj :Ack --java
nmap <leader>ackm :Ack --make
nmap <leader>ackx :Ack --xml
nmap <leader>ackf :AckFile 

" CtrlP
"let g:ctrlp_working_path_mode = 'rdac'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_user_command = 'find %s -type f | grep -v -P -i "\.jpg$|\.png$|\.ogg$|/tmp/|\.wav$|\.ttf$|\.mp4$|\.bmp$|\.ico$|\.so$|\.a$|\.jar$|\.o$"'
"set autochdir


" grep
nnoremap <silent> <F3> :Rgrep<CR><home>\<<end>\>
nnoremap <silent> <F4> :Bgrep<CR>
nnoremap <silent> <F5> :Rgrep<CR><c-u>
let g:Grep_Skip_Dirs = '.git'
let g:Grep_Skip_Files = 'tags'

set wildignore=*.o,*.obj,*.bak,*.exe,*.aux,*.dvi,tags


" to hex
nmap \hex  :%!xxd<cr>

nmap \cq :cclose<cr>

" cscope
" find `pwd` -type f | grep -v -P -i "\.jpg$|\.png$|\.ogg$|/tmp/|\.wav$|\.ttf$|\.mp4$|\.bmp$|\.ico$|\.so$|\.a$|\.jar$|\.o$" > cscope.files
"

" set incsearch

" \;.   copy last editor
" \'.   goto last editor
" :his s    show search history
" q/        show search history in window
" !!command     get then command output
"
" n>    shrink

" Edit mode
imap <c-w> <esc>wwi
imap <c-b> <esc>bbi

" normal mode
"







nmap \tr :call append(line("."), 'Slog.i("line", getTraceInfo() + "====" + "'. getline(line(".")) .'");')<cr>


":set ignorecase

" call:
" setline getline append
