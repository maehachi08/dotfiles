"-------------------------------
" Shougo/vimfiler.vim
" ディレクトリエクスプローラ設定
"
" Key bind tips:
"   <TAB>      VimFilerExploreから展開中のvim画面への移動
"   <F2>       VimFilerExplore 水平分割で表示する
"   :tree      ファイラーへ移動(もしくは起動)
"   :filer     ファイラーへ移動(もしくは起動)
"   :ft        ファイラーへ移動(もしくは起動)
"-------------------------------
" vimを起動したらデフォルトでファイラーが起動する
" autocmd VimEnter * execute 'VimFilerExplore'

" 隠しファイル扱い
let g:vimfiler_ignore_pattern = ['^\.DS_Store$']

" :VimFiler で :VimFilerExplore と同じようにIDE的な感じでファイラーを起動する
let g:vimfiler_as_default_explorer = 1

" インサートモードで開始しない
let g:unite_enable_start_insert = 0
let g:vimfiler_enable_auto_cd = 1

" :tree / :filer / :ft でファイラーへ移動(もしくは起動)
noremap <silent>:tree :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
noremap <silent>:filer :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
noremap <silent>:ft :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
noremap <F2>  :VimFiler -split -horizontal -project -toggle -quit<CR>

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

autocmd FileType vimfiler nnoremap <buffer><silent>/  :<C-u>Unite file -default-action=vimfiler<CR>
autocmd FileType vimfiler nnoremap <silent><buffer> e :call <SID>vimfiler_tree_edit('tabopen')<CR>
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)

noremap <silent> :bookmark :Unite bookmark<CR>
