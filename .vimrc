scriptencoding utf-8
set encoding=utf-8
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"-------------------------------
" 基本設定
"-------------------------------
set notimeout
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set clipboard=unnamed             "OSのクリップボードを使用する
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=5000
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set vb t_vb=                      "ビープ音を鳴らさない
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set shell=/bin/bash
set autoread
" set mouse=a
filetype plugin indent on
syntax enable
filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
set t_Co=256

"-------------------------------
" Vim Tab 設定
" refs http://qiita.com/wadako111/items/755e753677dd72d8036d
"-------------------------------
" tc     : create new tab
" tx     : close tab
" tn     : next tab
" tp     : previous tab
" t1..t9 : jump Nth from the left
"-------------------------------
source ~/.vim/vim_tab.vim

"-------------------------------
" Vim Window 設定
"-------------------------------
source ~/.vim/vim_window.vim

" ファイルアイコン
" https://github.com/ryanoasis/vim-devicons#installation
"
"  setup
"    1. フォントインストール
"    refs https://github.com/ryanoasis/nerd-fonts#font-installation
"
"      Option 4: Homebrew Fonts
"        $ brew tap homebrew/cask-fonts
"        $ brew cask install font-hack-nerd-font
"
"      Option 6: Ad Hoc Curl Download
"        $ cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
set guifont=<FONT_NAME>:h<FONT_SIZE>
let g:airline_powerline_fonts = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"-------------------------------
" undoの永続化
"-------------------------------
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  exe 'set undodir=' .. undo_path

  if !isdirectory(undo_path)
    call mkdir(undo_path, "p")
  endif

  set undofile
endif

"-------------------------------
" .vimrc 再読み込み設定
"-------------------------------
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

"-------------------------------
" プラグイン設定(dein.vim)
"-------------------------------
" https://github.com/Shougo/dein.vim
" sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
" :call dein#install()
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

set runtimepath+=~/.cache/dein.vim/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein.vim')

call dein#begin(expand('~/.cache/dein.vim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('ryanoasis/vim-devicons')

  " git
  call dein#add('tpope/vim-fugitive')

  " terminal color schemes
  " https://ethanschoonover.com/solarized/
  " https://github.com/altercation/vim-colors-solarized
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('edkolev/tmuxline.vim')

  " Syntax checking
  call dein#add('scrooloose/syntastic')
  call dein#add('leshill/vim-json')

  " fuzzy finder
  call dein#add('junegunn/fzf', {'dir': '~/.fzf','do': './install --all'})
  call dein#add('junegunn/fzf.vim')
  call dein#add('yuki-yano/fzf-preview.vim', { 'rev': 'release/rpc' })

  " Coc need to enable some functions
  call dein#add('neoclide/coc.nvim', { 'rev': 'release', 'merged': 0 })
  call dein#add('antoinemadec/coc-fzf')

  " For help
  call  dein#add('sunaku/vim-shortcut')
  call  dein#add('reireias/vim-cheatsheet')
  call  dein#add('liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!'] })

  " keep window when delete buffer
  call  dein#add('rgarver/Kwbd.vim')

  call dein#add('puremourning/vimspector')
call dein#end()

if dein#check_install()
  call dein#install()
endif

"-------------------------------
" edkolev/tmuxline.vim
" https://github.com/arl/gitmux
" brew tap arl/arl
" brew install gitmux
"-------------------------------
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \'x'    : ['#(gitmux)'],
  \'y'    : '#(date)',
  \'z'    : '#H'}
let g:tmuxline_theme = 'papercolor'

"-------------------------------
" reireias/vim-cheatsheet
"-------------------------------
let g:cheatsheet#cheat_file = '~/.vim/cheetsheet.md'

let g:fzf_command_prefix = 'Fzf'

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

set runtimepath+=/usr/local/bin/fzf

function! FZGrep(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)

nnoremap <silent> ,p :GFiles<CR>
nnoremap <silent> ,P :Files<CR>
nnoremap <silent> ,s :RG<CR>
nnoremap <silent> ,c :Commits<CR>


"-------------------------------
" neoclide/coc.nvim
"-------------------------------
" Need to install following packages.
"
" Python:
" - pip install jedi-language-server pylint
"
" Terraform:
" - brew install hashicorp/tap/terraform-ls
"
" Groovy:
" - https://github.com/GroovyLanguageServer/groovy-language-server
let g:coc_confing_home = '~/.vim/coc-settings.json'
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-yaml',
            \ 'coc-vimlsp',
            \ 'coc-webview',
            \ 'coc-markdown-preview-enhanced',
            \ 'coc-markdownlint',
            \ 'coc-diagnostic',
            \ '@hexuhua/coc-copilot',
            \ 'coc-fzf-preview',
            \ 'coc-snippets',
            \ 'coc-lists',
            \ 'coc-git',
            \ 'coc-yank',
            \ 'coc-jedi',
            \ 'coc-groovy'
            \ ]
nnoremap <C-p> :CocList files<CR>
source ~/.vim/coc.vim
source ~/.vim/coc-snippet.vim


"-------------------------------
" rgarver/Kwbd.vim
"-------------------------------
" keep window when buffer delete
nnoremap <silent>:bd <Plug>Kwbd
nnoremap <silent>:bw <Plug>Kwbd

"-------------------------------
" prabirshrestha/vim-lsp
"-------------------------------
" source ~/.vim/vim-lsp.vim
source ~/.vim/ghq.vim

"-------------------------------
" liuchengxu/vim-which-key
"-------------------------------
source ~/.vim/vim-which-key.vim

"-------------------------------
" Shougo/unite.vim 設定
" refs http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
"-------------------------------
source ~/.vim/unite.vim


"-------------------------------
" Shougo/vimfiler.vim
"-------------------------------
source ~/.vim/vimfiler.vim


"-------------------------------
" altercation/vim-colors-solarized
" カラースキーマ設定
"-------------------------------
syntax enable
set background=dark
colorscheme desert
let g:solarized_termcolors = 256
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
let g:airline_solarized_bg='dark'

"-------------------------------
" 行番号の色を設定
" http://qiita.com/mochizukikotaro/items/def041700846adb903fe
"-------------------------------
hi LineNr ctermbg=8 ctermfg=247
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine


"-------------------------------
" vim-airline/vim-airline
" vim-airline/vim-airline-themes
"-------------------------------
source ~/.vim/airline.vim

