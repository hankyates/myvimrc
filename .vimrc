set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'jnurmine/Zenburn'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-git.git'
Bundle 'endel/vim-github-colorscheme'
Bundle 'ervandew/supertab.git'
Bundle 'tjennings/git-grep-vim'
"Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/ZenCoding.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'duff/vim-scratch'
Bundle 'kien/ctrlp.vim'
Bundle 'skroll/vim-taghighlight'

"Bundle 'wincent/Command-T.git'
" vim-scripts repos
Bundle 'minibufexpl.vim'
Bundle 'L9'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" Statusline Settings
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%{SyntasticStatuslineFlag()}%=%-14.(%l,%c%V%)\ %P

" Text settings
syntax enable
colors zenburn
set guifont=Consolas:h21
let g:zenburn_high_Contrast=1
set t_Co=256
hi NonText ctermfg=7 guifg=gray
set listchars=tab:\|\ ,trail:~,extends:>,precedes:<
set list hls nowrap nu expandtab

" Spacing related settings
set softtabstop=4 tabstop=4 shiftwidth=4 smarttab smartindent

" Folding
set foldmethod=indent
set foldlevel=99

" Gui Options
set guioptions+=TlLrRbB
set guioptions-=TlLrRbB

au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au BufNewFile,BufRead *.soy set ft=html


" Sets and Lets
let g:miniBufExplSplitBelow=0
let g:miniBufExplMaxSize=0
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Window Navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" User Mappings
map <Leader>wr :set wrap!<CR>
map <Leader><Tab> :NERDTreeToggle<CR>
map <Leader>\ :!
map <Leader>mm :TMiniBufExplorer<CR>
map <Leader>aa :GitGrep 
map <Leader>as :GitGrep <cword><CR>
map <Leader>sr :call ReloadAllSnippets()<CR>
map <Leader>e :Vexplore<CR>

" Git Commands
map <Leader>ga :Gwrite<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd ::CMiniBufExplorer<CR>Gdiff<CR>

map <Leader>[ :colors Zenburn<CR>:set guifont=Consolas:h21<CR>
map <Leader>] :colors morning<CR>:set guifont=Consolas:h21<CR>

" Spacing Binds
map <Leader>ll :set list!<CR>
map <Leader>oo :set expandtab!<CR>:retab!<CR>:set list!<CR>
map <Leader>/ :nohls<CR>

" VIM management
map <Leader>bi :BundleInstall<CR>
map <Leader>bu :BundleInstall!<CR>
map <Leader>bc :BundleClean<CR>

"Ctrl+p stuff
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_map = '<leader>p'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,bin,Build,Website/1*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|node_module|Libraries|lib|bin)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"Syntastic 
map <Leader>se :Errors<CR>
map <Leader>sc :SyntasticCheck<CR>
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_jshint_conf = '~/.jshintrc'
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars --move_var"
let g:syntastic_disabled_filetypes=['html']
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

"Tag and src viewer
map <Leader>t :TagbarToggle<CR>
set tags=./tags;./jstags;/
