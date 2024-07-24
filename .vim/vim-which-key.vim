"-------------------------------
" liuchengxu/vim-which-key
" https://github.com/liuchengxu/space-vim/blob/cabe884b7f47a537311424e662d421a9c49a1678/layers/%2Btools/lsp/config.vim
"-------------------------------
set timeoutlen=500 " 100msだと他のキーマッピングが上手く動かないため500msに設定

let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>,      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader>, :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}

let g:which_key_map.f = {
      \ 'name' : '+vim-finder' ,
      \ 'o': {
        \ 'name': '+open vimfiler',
        \ 'e' : [':VimFilerExplorer', 'open/close vimfiler explore same as side bar'],
        \ 't' : [':VimFilerTab', 'open vimfiler explore as new tab'],
      \ },
      \ 'b' : [':Unite bookmark', 'open bookmark use Unite'],
    \ }



let g:which_key_map.f = {
      \ 'name' : '+vim-finder' ,
      \ 'o': {
        \ 'name': '+open vimfiler',
        \ 'e' : [':VimFilerExplorer', 'open/close vimfiler explore same as side bar'],
        \ 't' : [':VimFilerTab', 'open vimfiler explore as new tab'],
      \ },
      \ 'b' : [':Unite bookmark', 'open bookmark use Unite'],
    \ }

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'c': {
        \ 'name': '+create new window',
        \ 's' : [':new'       , 'create new window with Split']    ,
        \ 'v' : [':vnew'      , 'create new window with Vertical'] ,
      \ },
      \ 'w' : ['<C-W>w'     , 'move to next window']             ,
      \ 'd' : ['<C-W>c'     , 'delete current window']           ,
      \ '-' : ['<C-W>s'     , 'split window below(Split)']       ,
      \ '|' : ['<C-W>v'     , 'split window right(Vertical)']    ,
      \ 'h' : ['<C-W>h'     , 'window left']                     ,
      \ 'j' : ['<C-W>j'     , 'window below']                    ,
      \ 'l' : ['<C-W>l'     , 'window right']                    ,
      \ 'k' : ['<C-W>k'     , 'window up']                       ,
      \ 'H' : ['<C-W>5<'    , 'expand window left']              ,
      \ 'J' : [':resize +5' , 'expand window below']             ,
      \ 'L' : ['<C-W>5>'    , 'expand window right']             ,
      \ 'K' : [':resize -5' , 'expand- window up']               ,
      \ '=' : ['<C-W>='     , 'balance window']                  ,
      \ 's' : ['<C-W>s'     , 'split window below']              ,
      \ 'v' : ['<C-W>v'     , 'split window below']              ,
      \ '?' : ['Windows'    , 'fzf window']                      ,
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['Kwbd'      , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map.t = {
      \ 'name' : '+tabs'               ,
      \ 'c' : [':tabnew'               , 'create new tab'],
      \ 'x' : [':tabclose'             , 'close tab'],
      \ 'n' : [':tabnext'              , 'move to next tab'],
      \ 'p' : [':tabprevious'          , 'move to previous tab'],
      \ 's' : [':VimShellTab'          , 'create new tab with launch vimshell'],
      \ }

call which_key#register('<Space>', "g:which_key_map")

