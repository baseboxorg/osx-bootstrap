" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" Vim utilities that may be used by other plugins
Bundle 'vim-misc'
" Bundle "tomtom/tlib_vim.git"

Bundle 'xolox/vim-session'
Bundle "airblade/vim-gitgutter"
Bundle 'lukerandall/haskellmode-vim'
Bundle 'moll/vim-bbye'

" Html, Xml, Css, Markdown, Yaml...
Bundle "kchmck/vim-coffee-script"
" Provides ghmarkdown (github-flavored markdown)
Bundle "jtratner/vim-flavored-markdown.git"
" Faster yaml syntax files
Bundle "stephpy/vim-yaml"
Bundle "mustache/vim-mustache-handlebars"

" D
" Bundle "d.vim"

" Git related...
" Bundle "gregsexton/gitv"
" Bundle "tjennings/git-grep-vim"
Bundle "tpope/vim-fugitive"
" syntax, indent, and filetype plugin files for git, gitcommit, gitconfig,
" gitrebase, and gitsendemail.
Bundle "tpope/vim-git"

" " General text editing improvements...
Bundle "tomtom/tcomment_vim.git"
Bundle "rking/ag.vim"
Bundle "scrooloose/syntastic.git"
Bundle "skwp/vim-colors-solarized"
Bundle "SirVer/ultisnips"

" Trying before buying...
Bundle "kien/ctrlp.vim"
Bundle "kurkale6ka/vim-swap"
Bundle "jdonaldson/vaxe"
Bundle "wting/rust.vim"

"Filetype plugin indent on is required by vundle
filetype plugin indent on
