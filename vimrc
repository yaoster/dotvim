" SETUP INSTRUCTIONS :
" copy over this .vimrc file to home directory
" create the .vim directory under the home directory, or set the VIMHOME variable
" under the .vim directory, create the directorys: doc, plugin, syntax, tags, view
" copy over filetype.vim into .vim
" set up tab completion: install supertab
" set up C++11 syntax support: install cpp11
" set up tag browser: install taglist
" set up directory browser: install nerdtree
" set up xml editing: install xmledit, http://www.vim.org/scripts/script.php?script_id=1397
" set up help tags: go to $VIMHOME/doc directory, run :helptags .
" TODO : ctags
" set these aliases :
"     alias vi="vim"
"     alias ctags="/usr/bin/ctags"
"     alias tmptags="ctags -R --tag-relative=yes -f /home/daniely/.vim/tags/tmp .; ls -lh /home/daniely/.vim/tags/tmp"
"     alias cpptags="ctags -R --tag-relative=yes -f /home/daniely/.vim/tags/cpp /usr/include/c++/4.1.1; ls -lh /home/daniely/.vim/tags/cpp"
"     alias boosttags="ctags -R --tag-relative=yes -f /home/daniely/.vim/tags/boost /home/daniely/snapstatic/trunk/boost; ls -lh /home/daniely/.vim/tags/boost"
"     ... etc
"
" navigation shortcuts are set as follows:
" F2 : switch buffers
" F3 : goto tag
" F4 : goback from tag
" F5 : file taglist sidebar
" F6 : file navigation sidebar

" Pathogen settings
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

" filetype on
set nocompatible                                  " make vim less compatible with vi
set nu                                            " line numbers

" search settings
set hlsearch                                      " highlight search results

" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2

" line wrapping (both viewing and inputting)
set nowrap
set textwidth=0

" Indentation
set shiftwidth=4                                  " how many spaces to tab
set softtabstop=4
set smarttab
set expandtab
set ts=4
set autoindent
filetype plugin indent on

" NAVIGATION SHORTCUTS
" Buffer navigation and management
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-y> :set nowrap!<CR>
" cnoremap <expr> bo 'BufOnly'
nnoremap <F2> :buffers<CR>:buffer<Space>

" Tag navigation
nnoremap <F3> :tags<CR>:tag<Space>
nnoremap <F3> g<C-]>
nnoremap <F4> <C-T>
nnoremap <F5> :TlistToggle<CR>
let Tlist_Highlight_Tag_On_BufEnter = 0

" File/directory navigation
nnoremap <F6> :NERDTree<CR>

" Sign markers
sign define information text=!> linehl=Warning texthl=Error icon=/path/to/information.xpm
nnoremap <F7> :exe ":sign place ".line(".")." line=".line(".")." name=information file=".expand("%:p")<CR>
nnoremap <F8> :sign unplace<CR>

" Text searching
let mapleader='_'
let maplocalleader='_'
nnoremap \ *
nnoremap \| #
"nnoremap ] *
"nnoremap [ #
"set timeoutlen=50
"set ttimeoutlen=50

" Text pasting
nnoremap <C-p> :set paste!<CR>

" home desktop tags and work tags
"set tags=/home/yaoster/.vim/tags/stdlibcpp,/home/yaoster/.vim/tags/mysrc,/home/yaoster/.vim/tags/tmp,/home/daniely/.vim/tags/tmp,/home/daniely/.vim/tags/snapsrc,/home/daniely/.vim/tags/boost,/home/daniely/.vim/tags/
"set tags=$HOME/.vim/tags;/,./tags;/
set tags=/Users/dyao/.vim/tags/tmp

" Color schemes
highlight Folded term=standout ctermfg=6 ctermbg=0
highlight StatusLine term=reverse cterm=reverse ctermfg=10
highlight StatusLineNC term=reverse cterm=reverse ctermfg=7
highlight Normal guifg=White guibg=Black
highlight Cursor guifg=Black guibg=Yellow
highlight Keyword guifg=#FF6600
highlight Define guifg=#FF6600
highlight Type guifg=White gui=NONE
highlight rubySymbol guifg=#339999 gui=NONE
highlight Identifier guifg=White gui=NONE
highlight rubyStringDelimiter guifg=#66FF00
highlight rubyInterpolation guifg=White
highlight rubyPseudoVariable guifg=#339999
highlight Constant guifg=#FFEE98
highlight Function guifg=#FFCC00 gui=NONE
highlight Include guifg=#FFCC00 gui=NONE
highlight Statement guifg=#FF6600 gui=NONE
highlight String guifg=#66FF00
highlight Search ctermfg=Black ctermbg=Yellow cterm=NONE
highlight Error ctermfg=Black ctermbg=Red cterm=NONE
highlight Directory ctermfg=6 ctermbg=0
highlight Break ctermfg=White ctermbg=Blue

" highlighting
" match Error /ERROR/
2match Error /HACK/
3match Search /TODO/
match Break /BREAK/

" Abbreviations and templates
iabbrev cheader //================================================================
iabbrev pycheader #=================================================================
iabbrev fori for(unsigned int i = 0; ; ++i)<CR>{<CR>}
iabbrev hheader #ifndef _<CR>#define _<CR><CR><CR><CR>#endif

au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp set syntax=cpp11
syntax on
"highlight Comment ctermfg=Blue

" folding
au BufWinLeave * silent! mkview                   " automatically save folds when exiting window - note that this needs a $VIMHOME/view directory
au BufWinEnter * silent! loadview                 " automatically load folds when starting window
set nofoldenable                                  " make default view all folds open
set foldmethod=indent                             " either syntax or indent for my uses

" enable mouse usage
set mouse=
nnoremap <C-m> :set ttymouse=xterm2<CR>:set mouse=a<CR>
nnoremap <C-n> :set ttymouse=xterm2<CR>:set mouse=<CR>

set colorcolumn=121
