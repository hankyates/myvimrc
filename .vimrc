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
Bundle 'ervandew/supertab.git'
"Bundle 'mileszs/ack.vim.git'
Bundle 'tjennings/git-grep-vim'
Bundle 'sjl/gundo.vim.git'
Bundle 'vim-scripts/TaskList.vim.git'
"Bundle 'majutsushi/tagbar'
Bundle 'int3/vim-taglist-plus'
Bundle 'rson/vim-conque'
Bundle 'nono/vim-handlebars'
Bundle 'scrooloose/nerdcommenter'

" Ruby Related Bundles
Bundle 'tpope/vim-rails'
Bundle 'astashov/vim-ruby-debugger'

" Python Related Bundles
"Bundle 'gotcha/vimpdb'
"Bundle 'fs111/pydoc.vim.git'
"Bundle 'vim-scripts/pep8.git'
"Bundle 'mitechie/pyflakes-pathogen.git'

"Bundle 'wincent/Command-T.git'
" vim-scripts repos
Bundle 'minibufexpl.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'

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

set nu

" Statusline Settings
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%{SyntasticStatuslineFlag()}%=%-14.(%l,%c%V%)\ %P

" Text settings
syntax enable
colors zenburn
let g:zenburn_high_Contrast=1
set t_Co=256
hi NonText ctermfg=7 guifg=gray
set listchars=eol:\|,tab:\|\ ,trail:~,extends:>,precedes:<
set hls

" Spacing related settings
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab

" Folding
set foldmethod=indent
set foldlevel=99

" Gui Options
set guioptions+=TlLrRbB
set guioptions-=TlLrRbB

" Filetype Settings
au FileType ruby,eruby,haml
  \ set softtabstop=2 |
  \ set tabstop=2 |
  \ set shiftwidth=2 |
  \ set omnifunc=rubycomplete#Complete |
  \ let g:rubycomplete_buffer_loading = 1 |
  \ let g:rubycomplete_rails = 1 |
  \ let g:rubycomplete_classes_in_global = 1 |
  \ hi Pmenu ctermbg=238 gui=bold 

au FileType python 
  \ set omnifunc=pythoncomplete#Complete |
  \ set softtabstop=4 |
  \ set tabstop=4 |
  \ set shiftwidth=4


" Sets and Lets
let g:miniBufExplSplitBelow=0
let g:miniBufExplMaxSize=0
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:ruby_debugger_progname = 'mvim'
set completeopt=menuone,longest,preview
set omnifunc=syntaxcomplete#Complete

" Window Navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" User Mappings
map <Leader>wr :set wrap!<CR>
map <Leader><Tab> :NERDTreeToggle<CR>
map <Leader>\ :MiniBufExplorer<CR>
map <Leader>mm :TMiniBufExplorer<CR>
map <Leader>tt <Plug>TaskList
map <Leader>gg :GundoToggle<CR>
map <Leader>aa :GitGrep 
map <Leader>as :GitGrep <cword><CR>
map <Leader>sr :call ReloadAllSnippets()<CR>
map <Leader>` :TlistToggle<CR>

" Git Commands
map <Leader>ga :Gwrite<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gs :TMiniBufExplorer<CR>:Gstatus<CR>
map <Leader>gd :Gdiff<CR>

" FuzzyFinder Binds
map <Leader>ww :FufCoverageFile<CR>

map <Leader>] :colors morning<CR>
map <Leader>[ :colors zenburn<CR>

" Spacing Binds
map <Leader>ll :set list!<CR>
map <Leader>oo :set expandtab!<CR>:retab!<CR>:set list!<CR>
map <Leader>/ :nohls<CR>

" VIM management
"map <Leader>rr :so $MYVIMRC<CR>
map <Leader>bi :BundleInstall<CR>
map <Leader>bu :BundleInstall!<CR>
map <Leader>bc :BundleClean<CR>

"Ruby Debugger 
map <Leader>rb  :call g:RubyDebugger.toggle_breakpoint()<CR>
map <Leader>rv  :call g:RubyDebugger.open_variables()<CR>
map <Leader>rm  :call g:RubyDebugger.open_breakpoints()<CR>
map <Leader>rt  :call g:RubyDebugger.open_frames()<CR>
map <Leader>rs  :call g:RubyDebugger.step()<CR>
map <Leader>rf  :call g:RubyDebugger.finish()<CR>
map <Leader>rn  :call g:RubyDebugger.next()<CR>
map <Leader>rc  :call g:RubyDebugger.continue()<CR>
map <Leader>re  :call g:RubyDebugger.exit()<CR>
map <Leader>rd  :call g:RubyDebugger.remove_breakpoints()<CR>
map <Leader>re :RdbEval 
map <Leader>rl :RdbLog<CR>
map <Leader>rr :RdbStop<CR>:Rdebugger 'script/rails s'<CR>

"Syntastic 
map <Leader>se :Errors<CR>
map <Leader>sc :SyntasticCheck<CR>

" Conque Binds
map <Leader>sh :ConqueTermVSplit bash<CR> 
map <Leader>sw :ConqueTerm bash<CR> 
