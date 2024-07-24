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

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew <bar> :VimFilerExplorer<CR>

" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>

" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>

" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>
