"-------------------------------
" Vim Window 設定
"-------------------------------
" Split window
map wcs :new<Return>
map wcv :vnew<Return>
map ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" WindowCloseOnLast
" :qでwindowを閉じる時、複数のbufferが存在する場合はbufferを閉じる動作に変更する
function! WindowCloseOnLast()
    let w:buf_count = 0
    let w:buf_count = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    if w:buf_count == 1
        :q
    else
        :bd
    endif
endfunction
nnoremap <Plug>(window_close_on_last) :<C-u>call WindowCloseOnLast()<CR>
nnoremap <silent>:q<CR> <Plug>(window_close_on_last)
