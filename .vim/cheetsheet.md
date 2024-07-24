# VIM Cheatsheet

## Help

- `@` + `,`  : vim-which-key起動
- `:Cheet`   : ~/.vim/cheetsheet.md を表示

## Tab

- `t` + `c` : 新しいTabを作成
- `t` + `x` : 選択中のTabを閉じる
- `t` + `n` : 次のTabへ移動
- `t` + `p` : 前のTabへ移動
- `<C-n>`   : 次のTabへ移動 (AirlineSelectNextTab)
- `<C-p>`   : 前のTabへ移動 (AirlineSelectPrevTab)

## Wnindow

### 分割/閉じる

- `w` + `c` + `s`   : 水平分割で新しいWindowを作成(`:new` と同じ)
- `w` + `c` + `v`   : 垂直分割で新しいWindowを作成(`:vnew` と同じ)
- `s` + `s`         : 水平分割で選択中のWindowを分割
- `s` + `v`         : 垂直分割で選択中のWindowを分割

### 高さ/幅の変更

- `<C-w>` + `<left>`   : 選択中のWindowの幅を狭める
- `<C-w>` + `<right>`  : 選択中のWindowの高さを広げる
- `<C-w>` + `<up>`     : 選択中のWindowの高さを広げる
- `<C-w>` + `<down>`   : 選択中のWindowの高さを狭める

### Windowの移動

- `s` + `h` : 左のWindowへ移動する
- `s` + `j` : 下のWindowへ移動する
- `s` + `k` : 上のWindowへ移動する
- `s` + `l` : 右のWindowへ移動する

## VimFiler

- `<TAB>`    : VimFilerExploreから展開中のvim画面へ移動
- `<SPACE>`  : 展開中のvim画面から起動中のVimFilerExploreへ移動
- `<F2>`     : VimFilerExplore 水平分割で表示する
- `:tree`    : ファイラーへ移動(もしくは起動)
- `:filer`   : ファイラーへ移動(もしくは起動)
- `:ft`      : ファイラーへ移動(もしくは起動)

## Tips

- INSERT mode で Ctrl+p : 入力補完

