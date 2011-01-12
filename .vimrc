call pathogen#runtime_append_all_bundles()
filetype off
call pathogen#helptags()

if has("gui_running")
    set guifont=Liberation\ Mono\ 8" use this font
    set lines=75          " height = 50 lines
    set columns=180       " width = 100 columns
    set background=dark   " adapt colors for background
    set keymodel=
    set mousehide
    colorscheme molokai
    " colorscheme void

    " To set the toolbars off (icons on top of the screen)
    set guioptions-=T
else
    set background=dark   " adapt colors for dark background
    " colorscheme lucius
    colorscheme molokai
    set t_Co=256
endif

:runtime macros/matchit.vim

" ==================================================
" " Basic Settings
" " ==================================================
let mapleader=","       " change the leader to be a comma vs slash
set textwidth=79
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent
set autoindent
set smarttab
set expandtab
set backspace=indent,eol,start
set history=500
set ruler  
set hlsearch
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set nocompatible
set ignorecase
set incsearch
set smartcase
set showmatch
set showcmd
set hid

set modelines=0

set encoding=utf-8
" set cursorline
set ttyfast

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" ,v brings up my .vimrc
" " ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" shortcuts for copying to clipboard
vmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>Y "+yy

" shortcut to toggle spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>
" setup a custom dict for spelling
" " zg = add word to dict
" " zw = mark word as not spelled correctly (remove)
set spellfile=~/.vim/dict.add

" shortcuts to open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" ==================================================
" " Windows / Splits
" " ==================================================
"
" " ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" use - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+
" and for vsplits with alt-< or alt->
map <M-,> <C-W>>
map <M->> <C-W><

" ==================================================
" " Filetypes
" " ==================================================
"
" " Auto change the directory to the current file I'm working on
" autocmd BufEnter * lcd %:p:h

" automatically give executable permissions if file begins with #! and contains
" " '/bin/' in the path
" au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

" set relativenumber " 7.3 version needed
" set undofile  " 7.3 version needed

" fix Vim horribly broken default regex handling by automatically inserting a \v before any string you search for.
" nnoremap / /\v
" vnoremap / /\v
" nnoremap / /
" vnoremap / /

" to clear out a search
nnoremap <leader><space> :noh<cr>

" to remap matching brackets
nnoremap <tab> %
vnoremap <tab> %

set wrap
set formatoptions=qrn1
"set colorcolumn=85

" Next, get rid of that stupid goddamned help key that you will invaribly hit constantly while aiming for escape:
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" I have a <leader>v mapping to reselect the text that was just pasted so I can perform commands (like indentation) on it:

" nnoremap <leader>v V`]

" This last mapping lets me quickly open up my ~/.vimrc file in a vertically split window so I can add new things to it on the fly.
" nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>


" I personally use jj to exit back to normal mode. The only time Iâve ever actually tried to hit two jâs in a row is just now while writing this entry, so it doesnât conflict with my normal typing at all:
inoremap jj <ESC>

" This first mapping makes ,w open a new vertical split and switch over to it. Because really, how often do you split your window and not want to do something in the new split?
nnoremap <leader>w <C-w>v<C-w>l

" This next set of mappings maps <C-[h/j/k/l]> to the commands needed to move around your splits. If you remap your capslock key to Ctrl it makes for very easy navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" sudo writes
cmap w!! %!sudo tee > /dev/null %

" lambda key and sum key
imap <C-a> λ
imap <C-S> ∑


set background=dark
" colorscheme default
" colorscheme molokai 
syntax on

set nobackup
set nowritebackup

" let mapleader = ","

let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

"map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>


filetype off

if has("autocmd")
  filetype indent on
  filetype plugin on
endif

autocmd FileType ruby set shiftwidth=2
autocmd FileType c set shiftwidth=8 tabstop=8 noexpandtab

"au BufRead,BufNewFile *.rl setlocal filetype=ragel

"from my old .vimrc file
" To insert timestamp, press F5.
nmap <F5> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Show autocomplete menus.
set wildmenu
set wildmode=list:longest


" Show editing mode
set showmode

" Try to show at least three lines and two columns of
" context when scrolling
set scrolloff=3
set sidescrolloff=2

" source $VIMRUNTIME/vimrc_example.vim
"dbext
source /home/chris/.vim/bundle/dbext/plugin/dbext.vim
" vmap <leader>se :DBExecRangeSQL


"SQL dbext connection
source /home/chris/.dbext_passes
let g:dbext_default_profile_chris_emeadb11 = chris_emeadb11
" let g:dbext_default_profile_chris_emeadb11scott = chris_emeadb11scott
let g:dbext_default_profile_hr_ubdb = hr_ubdb  
"let g:dbext_default_profile_chris_emeadb = 'type=ORA:user=chris:passwd=*****:host=10.165.252.86:port=1521:srvname=emeadb'
let g:dbext_default_profile_kcierpisz_mktgcd = kcierpisz_mktgcd
let g:dbext_default_profile_glm_tsbu64 = glm_tsbu64
let g:dbext_default_profile_kcierpiszjupiter = kcierpiszjupiter
let g:dbext_default_profile_computerprfile = computerprfile 
let g:dbext_default_profile_fairfax = fairfax
let g:dbext_default_profile_kcierpisz_mktgcd_dbi = kcierpisz_mktgcd_dbi
let g:dbext_default_profile_guest_test = guest_test
let g:dbext_default_profile_titlemapload_dqmap = titlemapload_dqmap

:let  g:dbext_default_use_win32_filenames = 1


autocmd FileType c,cpp :set cindent
autocmd FileType rb :set filetype=ruby


map <F4> :!ruby %<CR>
map ,r :!ruby %<CR>
map ,ht :runtime! syntax/2html.vim<CR>:wq<CR>
map <F9> :runtime! syntax/2html.vim<CR>:wq<CR>


map <F12> :set number!<CR>


:function! ReverseBackground()
:   let Mysyn=&syntax
:   if &bg=="light"
:       se bg=dark
:       highlight Normal guibg=black guifg=white
:   else
:       se bg=light
:       highlight Normal guibg=white guifg=black
:   endif  
:   syn on  
:   exe "set syntax=" . Mysyn
":   echo "now syntax is "&syntax
:endfunction
:command! Invbg call ReverseBackground()
:noremap <F11> :Invbg<CR>

:function! Smaller(zoom)
: echo "here"
: let current_size=matchstr(&guifont,'\d\+')
:
: if current_size >= 8 && a:zoom == "smaller"
:   let new_size = current_size - 2
: elseif current_size <= 30 && a:zoom == "bigger"
:   let new_size = current_size + 2
: endif
:
: try
:   let &guifont = substitute(&guifont,current_size,new_size,'g')
:   echo "current font" . &guifont
:   set lines=35 columns=110
: catch /E121:/
:   echo "afer change: " . " " . &guifont . " - "
: endtry
:
:endfunction

:command! SmallerCmd call Smaller("smaller")
:command! BiggerCmd call Smaller("bigger")
:noremap <F2> :SmallerCmd<CR>
:noremap <F3> :BiggerCmd<CR>


if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  " autocmd BufReadPost *
  "   \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "   \   exe "normal! g`\"" |
  "   \ endif
  " 
  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" for markdown
augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END


" :function! PreviewMKD()
" :ruby << EOF
" "require 'rubygems'
" require 'bluecloth'
" t = ""
" VIM::Buffer.current.count.times {|i| t += "#{VIM::Buffer.current[i + 1]}\n"}
" html_file = VIM::Buffer.current.name.gsub(/.(md|mkd)$/, '.html')
" if html_file == VIM::Buffer.current.name
"   print "Error! - This file extension is not supported for Markdown previews"
" end
" File.open(html_file, 'w') do |f|
"   f.write(BlueCloth.new(t).to_html)
" end
" system("firefox #{html_file}")
" EOF
" :endfunction
" :
" :map <Leader>p :call PreviewMKD()<CR>

nnoremap <leader>1 yypVr=

" vorax
let g:vorax_oradoc_open_with = "tabnew | .!w3m '%u'"
let g:vorax_open_scratch_at_connect = 0

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2
