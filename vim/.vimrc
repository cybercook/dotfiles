"======================================
"NeoBundle settings
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/neobundle
call neobundle#rc(expand('~/.vim/bundle'))
"colorscheme desert
colorscheme torte

NeoBundle	'scrooloose/nerdtree'
"NeoBundle   'scrooloose/nerdcommenter'
"NeoBundle	'plasticboy/vim-markdown'
NeoBundle	'msanders/snipmate.vim'
NeoBundle	'vim-scripts/taglist.vim'
NeoBundle	'bling/vim-airline'
NeoBundle   'vim-airline/vim-airline-themes'
NeoBundle	'tpope/vim-fugitive'
NeoBundle	'kien/ctrlp.vim'
"NeoBundle	'altercation/vim-colors-solarized'
NeoBundle	'tomtom/tcomment_vim'
NeoBundle	'ap/vim-css-color'
NeoBundle	'L9'
NeoBundle	'vim-scripts/FuzzyFinder'
NeoBundle	'majutsushi/tagbar'
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle   'Valloric/YouCompleteMe'
"NeoBundle 'XML-Folding'

filetype plugin on
filetype indent on

" common settings 
set encoding=utf-8
set fileencodings=utf-8,cp950
"source $VIMRUNTIME/delmenu.vim  
"language messages zh_TW.utf-8
"source $VIMRUNTIME/menu.vim   
syntax on        " 語法上色顯示
set ignorecase  "搜索时忽略大小写  
"set nocompatible " VIM 不使用和 VI 相容的模式
set ai           " 自動縮排
set shiftwidth=4 " 設定縮排寬度 = 4 
set tabstop=4    " tab 的字元數
set softtabstop=4
set expandtab   " 用 space 代替 tab
"set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
"set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=10000  " 保留 100 個使用過的指令
"set cursorline   " 顯示目前的游標位置
set cmdheight=1 "命令部分高度为1  
set autoread        "当文件在外部被改变时，Vim自动更新载入  
set showmatch       "显示匹配的括号  

"""""""""""""""""""""""""""""""
" Folding setting
"""""""""""""""""""""""""""""""
set foldmethod=manual
"set foldmethod=marker
"set foldmethod=indent
"set foldlevelstart=99
"set foldmarker={{{,}}}
"let php_folding = 0 
"set foldlevel=3
"set foldnestmax=3

set wrap
"""""""""""""""""""""""""""""""

colorscheme	torte

nnoremap <silent> <C-m> :tabn <CR>
nnoremap <silent> <C-n> :tabN <CR>

" Taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_WinWidth = '50'
nnoremap <F12> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
"let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline_theme                      = "wombat" "设定主题
set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors 

" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 2

""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" NerdTree setting
""""""""""""""""""""""""""""""
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=0
let NERDTreeHighlightCursorline = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
"
nmap <F2> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""
" CtrlP Settings
""""""""""""""""""""""""""""""
let g:ctrlp_clear_cache_on_exit = 0 " 離開 vim 後不要清 cache
let g:ctrlp_max_files = 1000000 " 加大 cache 索引的檔案數, 否則會漏找檔案
let g:ctrlp_user_command = 'find %s -type f' " 使用 find 加速建索引的速度

""""""""""""""""""""""""""""""
" This section is for last time edit position
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

if has("cscope")
    set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    set cscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

if &diff
        colorscheme murphy
        " diff mode
        "set diffopt+=iwhite
endif

" python
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_python_binary_path = 'python'
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
