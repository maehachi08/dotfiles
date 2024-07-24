" https://qiita.com/yysaki/items/fb1cbca8933c6080ebb6
function! s:cd_repo(shell, repo) abort
    exe 'lcd' trim(system('ghq root')) .. '/' .. a:repo
    call s:open_terminal('new', '', a:shell)
    exe 'wincmd k'
    pwd
endfunction

function! s:repo(multi, cb) abort
    if executable('ghq') && exists('*fzf#run()') && executable('fzf')
        call fzf#run({
                    \ 'source': systemlist('ghq list'),
                    \ 'sink': a:cb,
                    \ 'options': a:multi,
                    \ 'down': '40%'},
                    \ )
    else
        echo "doesn't installed ghq or fzf.vim(require fzf)"
    endif
endfunction

command! Repo call s:repo('+m', function('s:cd_repo', [&shell]))

