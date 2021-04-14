# settings

##Vim
## NeoBundle
### Before ###
call neobundle#rc(expand('~/.vim/bundle/'))

### After ###
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
