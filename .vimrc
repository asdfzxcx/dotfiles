execute pathogen#infect()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  "set backup		  " keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		  " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
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
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | 
diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Set color scheme
syntax on
"set background=light
colorscheme obsidian
set t_Co=256
"colorscheme inkpot

" Use spaces instead of tabs. Use tab width equal to 2.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Write backup files to vim temp dir
" Backup section start
" See: https://stackoverflow.com/questions/26742313/why-vim-backup-filenames-are-not-correct-backupdir-option-not-performing-as-e
set nobackup
set backupdir=~/.vimtmp/backup//
autocmd BufWritePre * :call SaveBackups()

function! SaveBackups()
  if expand('%:p') =~ &backupskip | return | endif

  for l:backupdir in split(&backupdir, ',')
    :call SaveBackup(l:backupdir)
  endfor
endfunction

function! SaveBackup(backupdir)
  let l:filename = expand('%:p')

  if a:backupdir =~ '//$'
    let l:backup = escape(substitute(l:filename, '/', '%', 'g') . &backupext, '%')
  else
    let l:backup = escape(expand('%') . &backupext, '%')
  endif

  let l:backup_path = a:backupdir . l:backup
  :silent! execute '!cp ' . resolve(l:filename) . ' ' . l:backup_path
endfunction

set directory=~/.vimtmp/swap//,.
set undodir=~/.vimtmp/undo//,.

" Backup section end

set number

" set relativenumber
set so=10

" Key mappings
let mapleader = "\<Space>"

" Clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+p$a
nnoremap <C-v> <Esc>"+p$a

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" alternative tab movement (main actually)
nnoremap J :tabprev<CR>
nnoremap K :tabnext<CR>

" Splits
nnoremap <leader>w <C-w>w

" Show/hide NERDTree
nnoremap <F2> :NERDTreeTabsToggle<CR>

" Ruby ERB tags completion
inoremap <lt>% <% %><Esc>2hi

" Toggle search highlight
nnoremap <F3> :set hlsearch!<CR>

" Wrap EasyMotion hotkey
"map <Tab> <leader><leader>
map <Tab> <Plug>(easymotion-prefix)

" Scrolling in autocomplition popup using C-j C-k
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" Set background transparency
hi Normal ctermfg=252 ctermbg=none

" Enable vim-airline
set laststatus=2
set noshowmode

" Powerline options
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1 " Smart tabs ON

" Reduce exit from insert mode. Affects <Leader> key tho.
"set timeoutlen=150

set encoding=utf8

set mouse=c

