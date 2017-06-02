set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'alvan/vim-closetag'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bbye'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-expand-region'
Plugin 'kana/vim-textobj-user' "vim-textobj-ruby?依存
Plugin 'rhysd/vim-textobj-ruby'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'wellle/targets.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/html5.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/MatchTagAlways'
Plugin 'pearofducks/ansible-vim'
Plugin 'wavded/vim-stylus'
Plugin 'leafgarland/typescript-vim'

call vundle#end()            " required

filetype plugin indent on   
syntax on
set backspace=2
set nocompatible
set ai
set showmatch
set number "diplay line number
set encoding=utf8
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
set formatoptions-=r
set hidden

colorscheme molokai
let mapleader = "\<Space>"
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:NERDSpaceDelims=1
let g:ctrlp_cmd = 'CtrlPMRU'

" My Hotkey Settings
nnoremap <CR> O<Esc>
nnoremap <leader>k <c-^>
nnoremap <Leader>w :w<CR>
nnoremap Y <c-r>
" nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>. 
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <leader>hl :set hlsearch<CR>
nnoremap <leader>lh :nohlsearch <CR>
" nnoremap <leader><leader>j :sp<CR><c-w>j
nnoremap <leader><leader>l :vsp<CR><c-w>l
nnoremap <leader><leader>qq :q!<CR>
" nnoremap <leader><leader>h :vsp
" noremap <leader><leader>k :sp<CR>
nnoremap <leader>wp ^i<!-- <ESC>A --><ESC>
nnoremap <c-n> :NERDTree<CR>
nnoremap <leader>q :Bdelete<CR> 
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k

au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn


nnoremap <expr> <Leader>1 tweak#wtb_switch#key_leader_bufnum(1)
nnoremap <expr> <Leader>2 tweak#wtb_switch#key_leader_bufnum(2)
nnoremap <expr> <Leader>3 tweak#wtb_switch#key_leader_bufnum(3)
nnoremap <expr> <Leader>4 tweak#wtb_switch#key_leader_bufnum(4)
nnoremap <expr> <Leader>5 tweak#wtb_switch#key_leader_bufnum(5)
nnoremap <expr> <Leader>6 tweak#wtb_switch#key_leader_bufnum(6)
nnoremap <expr> <Leader>7 tweak#wtb_switch#key_leader_bufnum(7)
nnoremap <expr> <Leader>8 tweak#wtb_switch#key_leader_bufnum(8)
nnoremap <expr> <Leader>9 tweak#wtb_switch#key_leader_bufnum(9)
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
nmap <F8> :TagbarToggle<CR>
let g:expand_region_text_objects = {
      \ 'iw': 0,
      \ 'iW': 0,
      \ 'i"': 1,
      \ 'i''': 0,
      \ 'i}': 1,
      \ 'i]': 1,
      \ 'ib': 1,
      \ 'iB': 1,
      \ 'il': 0,
      \ 'ip': 0,
      \ 'ie': 0,
      \ 'i>': 0,
      \ 'a>': 1,
      \ 'ab': 1,
      \ 'aB': 1,
      \ }

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction

autocmd BufNewFile,BufRead *.styl set filetype=stylus
au BufNewFile,BufRead *.ejs set filetype=html
au BufRead,BufNewFile *.axlsx set filetype=ruby
