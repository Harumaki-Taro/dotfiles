# Vim Cheetsheet

## session (obsession.vim)

- `:mksession` : Session.vimをカレントディレクトリに保存
- `nvim -S`で起動 or `:source Session.vim`でセッション復元

## move

- `gg`    : ファイル先頭へ
- `G`     : ファイル末尾へ
- `I`     : 行頭で insert mode へ
- `A`     : 行末で insert mode へ
- `S`     : 行を消して insert mode へ
- `J`     : 行をスペース区切りで結合 (頭に数字で繰り返し)
- `gJ`    : 行を結合 (頭に数字で繰り返し)

## pane

- `:vs`   : 縦に分割
- `:sp`   : 横に分割
- `<C-e>` : 幅調整モードへ移行

## 一括に
- 行頭一括削除 : 行頭で`<C-v>`でビジュアル矩形モードに入り、`j`or`k`で移動し、`d`で一括削除
- 行頭一括挿入 : 行頭で`<C-v>`し、`j`or`k`で移動、`I`で挿入モードに入って、入力し、`<ESC>`

## buffer

-

## window

- `:qa`     : すべてのウィンドウを閉じる
- `:split`  : 水平分割
- `:vsplit` : 垂直分割
- `<C-w>@`  : @に移動 (@=h,j,k,l)
- `<C-w>w`  : 次に移動
- `<C-w>@`  : ディスプレイを@に移動 (@=H,J,K,L)
- ``

## insert mode

- `<C-[`>   : esc
- `<C-b>`   : backspace (独自割当)
- `o`       : 次の行を開けてinsert modeへ
- `0`       : 前の行を開けてinsert modeへ
- `r`       : 1文字だけreplace

## その他

- `gg=G`    : ソースコード全体のインデント修正
- `<C-n>`   : NerdTreeを表示
- `:grep -r 'hogehogehoge' * | cwp` : ディレクトリ下を一括検索

## ジャンプ

- `<C-o>`   : 直近のジャンプポイント/ファイルへジャンプする
- `<C-i>`   : `<C-o>`の逆
- `fg`      : カーソル位置の文字列をパスとみなして，そのファイル/urlへジャンプする
- `<C-^>`   : 直前のバッファにジャンプする (`fg`した後に元に戻る)
- `:vim[grep] {pattern} {file}`  : vim内でgrep, fileは`%`でカレントバッファを検索できる
- `:vim {pattern} \`git ls-files app/**/*.html\``  : appディレクトリ内でインデックスされている.htmlファイルを対象にする
- `:bufdo vimgrepa {pattern} %`  : 現在不バッファに乗っているファイルを対象に検索::
- `n / N`   : `\\`で検索したとき次/前の検索結果へ移動
- `<C-]>`   : ctagsでの定義ジャンプ
- `<C-t>`   : ctagsでの定義ジャンプから戻る
  - プロジェクトディレクトリで`ctags -R -f .tags`することで.tagsファイルが生成される．
- `F8`      : tagbarの表示

