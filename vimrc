set nocompatible
filetype off
filetype plugin indent on

" ==== Options ====
syntax on
set nohlsearch " To turn off highlighting after finish search
set number
set showmatch
set incsearch
set hidden
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set relativenumber
set ruler
set wrap
set ignorecase
set smartcase
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,vendor/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set encoding=utf-8

if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000 "Maximum number lines to save for undo on buffer reload
endif
set undolevels=1000 "Maximum number of changes that can be undone

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" File Types
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType cs setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

" Autoremove trailing spaces when saving the buffer
autocmd FileType python,c,cpp,go,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Status
set laststatus=2
set statusline=
set statusline+=%<\                     " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\      " buffer number, and flags
set statusline+=%-40f\                  " relative path
set statusline+=%=                      " separate between right- and left-aligned
set statusline+=%1*%y%*%*\              " file type
set statusline+=%10(L(%l/%L)%)\         " line
set statusline+=%2(C(%v/125)%)\         " column
set statusline+=%P                      " percentage of line

" Mapping Arrow key to NOP on insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Mapping Arrow key to NOP on normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Mapping Arrow key to NOP on virtual mode
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"" ==== Vim Plugin tool for other Plugin ====
"" Vim Repeat
Plug 'tpope/vim-repeat'

"" GIT Status on status line
Plug 'tpope/vim-fugitive'

"" virtual status line
Plug 'bling/vim-airline'

"" workman keyboard mapping
"Plugin 'nicwest/vim-workman'

"" ==== Text Formating ====
"" Surrounding the parenthesis [] {} () or tags
Plug 'tpope/vim-surround'

"" Easy Align charactors
Plug 'junegunn/vim-easy-align'

"" ==== Navigation on Vim ====
"" Easy Motion
Plug 'easymotion/vim-easymotion'

"" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

"" ==== Code completition ====
" Neo complete 
Plug 'Shougo/neocomplete.vim'

" Snippets code completition
Plug 'SirVer/ultisnips'

" Autocomplete
Plug 'ervandew/supertab'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Folding the code
Plug 'tmhedberg/SimpylFold'

"" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plug 'pangloss/vim-javascript'

"" React (jsx) syntax highlight
Plug 'mxw/vim-jsx'

"" HTML autocomplete
Plug 'mattn/emmet-vim'

Plug 'prettier/vim-prettier'

"" ==== Colour Scheme ====
Plug 'altercation/vim-colors-solarized'

call plug#end()

" ==== Config Plugin options ====

" == Airline ==
let g:airline_powerline_fonts = 1

let g:airline_section_z='%3p%% %#__accent_bold#%#__accent_yellow#%4l%#__restore__#:%3v'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = '⟫'
let g:airline_right_sep = '⟪'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols 
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" == NERDTree ==
let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo', 'node_modules']
let NERDTreeHijackNetrw = 0

" == Ignore file name inside the .gitignorefile
let g:netrw_list_hide= netrw_gitignore#Hide()

" ==== Shrtcuts ====
" Default <Leader> key is '\'

" == NERDTree ==
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" == Easy Align ==
" Start interactive EasyAlign in virtual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" == Easy Motion ==
" n-character search motion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
" hjkl motions
map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Migemo feature (for Japanese user)
"replace s on replace char to search of easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" ==== Insert Shortcuts ====
imap <C-L> <SPACE>=><SPACE>

" Setting the workman layout on insert mode but qwerty layout on normal mode
let g:workman_normal_workman = 0 "QWERTY  Layout - Workman Normal
let g:workman_insert_workman = 0 "QWERTY  Layout - Workman Insert
let g:workman_normal_qwerty = 0  "Workman Layout - QWERTY  Normal
let g:workman_insert_qwerty = 0  "Workman Layout - QWERTY  Insert
" hitting jj will jump out of insert mode
inoremap <silent> jj <ESC>

" ===================== CONFIGURE =====================
" set colorscheme to solarized
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Configure for NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
let g:NERDTreeLimitedSyntax = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow','#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" NERDTree Git symbol
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"" ===== NEOcomplete Configure =====
" Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:user_emmet_loader_key='<Tab>'
let g:user_emmet_settings = {
      \ 'javascript.jsx' : {
      \     'extends': 'jsx',
      \ },
      \}

