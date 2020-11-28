" =========================================================
" python3 path                                          {{{
" =========================================================
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
" }}}


" =========================================================
"  plugin                                               {{{
" =========================================================
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=$HOME/.dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state(expand('$HOME') . '/.dein')
"  call dein#begin(expand('$HOME') . '/.dein')
"
"  " プラグインリストを記述したTOMLファイルを読み込む
"  let g:rc_dir    = expand('$HOME') . '/.vim/rc'
"  let s:toml      = g:rc_dir . '/dein.toml'
"  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
"
"  call dein#load_toml(s:toml,      {'lazy': 0})
"  call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
"  " Let dein manage dein
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"syntax enable
"
"" pluginをuninstallするときは、:call dein#recache_runtimepath()
"call map(dein#check_clean(), "delete(v:val, 'rf')")
"
"" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

augroup Plugins
  autocmd!
  autocmd BufWritePost ~/.config/nvim/lua/plugins/*.lua PackerCompile
augroup END
lua require('plugins/init')
" }}}


" =========================================================
"  general                                             {{{1
" =========================================================
" --- 文字コード -------------------------------- {{{2
set encoding=utf-8     " vim内部の文字コード
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=utf-8,iso-2022-jp,ucs-boms,cp932,sjis,euc-jp " 読み込み時の文字コードの自動判別、左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別、左側が優先される
set ambiwidth=single " □や○文字の表示が崩れるのを解決(できてない windows terminalだと表示はできてる)
" }}}2
" --- updatetime -------------------------------- {{{2
set updatetime=100
" }}}2
" --- カーソル ---------------------------------- {{{2
set whichwrap=b,s,h,l,>,<,[,],~  " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set relativenumber            " 行番号を表示
set number
" set cursorline        " カーソルラインをハイライト
" set so=999            " 常にカーソルのある行を中央に表示
set nostartofline
set scrolloff=10       " スクロールするときに下が見えるようにする
let &t_SI.="\e[0 q"    " Blinking block in insert mode
let &t_EI.="\e[2 q"    " Block in normal mode
" }}}2
" --- マウス ------------------------------------ {{{2
set mouse=a           " どのモードでもマウスを使えるようにする
"set mousehide         " 入力時にマウスポインタを隠す (nomousehide: 隠さない)
" }}}2
" --- 永続化undo -------------------------------- {{{2
if has('persistent_undo')
  set undodir=$HOME/.vim/undo
  set undofile
endif
" }}}2
" --- 「-- 挿入 --」を非表示 -------------------- {{{2
set noshowmode
" }}}2
" --- ウィンドウ分割 ---------------------------- {{{2
set splitright        " 新しいウィンドウを右に開く
set splitbelow        " 新しいウィンドウを下に開く
" }}}2
" --- ポップアップ ------------------------------ {{{2
set pumblend=20        " 補完などに使われるポップアップメニューを半透明に表示 (0-100)
set winblend=20        " 任意の floating windows を半透明に表示します．
set pumheight=10       " 補完ポップアップメニューに表示される項目数の最大値
" }}}2
" --- 保存時自動処理 ---------------------------- {{{2
set hidden   " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
augroup PreWrite
  autocmd!
  autocmd VimEnter,BufEnter,WinNew * :match Error /\v[ 　	]+$/
augroup END
" }}}2
" --- ペースト設定 ------------------------------ {{{2
set clipboard&
set clipboard^=unnamedplus " yank した文字列をクリップボードにコピー
" if &term =~ "xterm"
"   let &t_ti .= "\e[?2004h"
"   let &t_te .= "\e[?2004l"
"   let &pastetoggle = "\e[201~"
"
"   function XTermPasteBegin(ret)
"     set paste
"     return a:ret
"   endfunction
"
"   noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
"   inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"   cnoremap <special> <Esc>[200~ <nop>
"   cnoremap <special> <Esc>[201~ <nop>
" endif
" }}}2
" --- 文字列検索 -------------------------------- {{{2
set incsearch         " インクリメンタルサーチ。1文字入力毎に検索を行う。
set ignorecase        " 検索パターンに大文字小文字を区別しない。
set smartcase         " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch          " 検索結果をハイライト
set grepprg=grep\ -nH " 外部grepを利用できるようにする
" }}}2
" --- コマンド補完 ------------------------------ {{{2
set wildmenu          " コマンドモードの補完
set history=5000      " 保存するコマンド履歴の数
" }}}2
" --- 括弧 -------------------------------------- {{{2
set showmatch         " 閉じ括弧が入力されたとき，対応する開き括弧にわずかの間ジャンプする
set matchtime=1       " マッチしているカッコを表示するための時間を0.1秒単位で指定
source $VIMRUNTIME/macros/matchit.vim  " Vimの'%'を拡張する
" }}}2
" --- タグジャンプ ------------------------------ {{{2
set tags=.tags;$HOME   " カレントディレクトリからホームディレクトリまで.tagsを探す．

function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡り、タグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合
  if tags_path ==# ''
    return
  endif
  " タグファイルのディレクトリパスを取得
  " `:p:h`の部分は、:h filename-modifiersで確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePre * call s:execute_ctags()
augroup END
" }}}2
" --- タブ・インデント -------------------------- {{{2
set autoindent        " 改行の際に自動でインデントする
set tabstop=2         " タブを何文字の空白に変換するか
set smartindent       " 改行の際に前の行の公文をチェックし次の行のインデントを増減する
set shiftwidth=2      " smartindentで増減する空白の数
set expandtab         " タブ入力を空白に変換
set softtabstop=2     " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
" }}}2
" --- 空白文字 ---------------------------------- {{{2
set listchars=tab:>-,trail:.,eol:¬,extends:»,precedes:«,nbsp:%
set list
" }}}2
" --- コメントアウト ---------------------------- {{{2
" 自動コメントアウトを無効
augroup comment
  autocmd!
  autocmd FileType * setlocal formatoptions-=ro
  " --- コメントアウト ------------------
  autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
  autocmd FileType lua nnoremap <buffer> <localleader>c I-- <esc>
  autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
  autocmd FileType ruby nnoremap <buffer> <localleader>c I# <esc>
augroup END
" }}}2
" --- 1行当たりの文字数制限 --------------------- {{{2
" 100文字以降背景色を変更
if (exists('+colorcolumn'))
  set colorcolumn=101
endif
" マルチバイト文字の自動折り返し
set formatoptions+=mM
set textwidth=100
augroup multibyte_font
  autocmd!
  autocmd BufNewFile,BufRead *.html setlocal formatoptions=q
augroup END
" }}}2
" --- 折り畳み ---------------------------------- {{{2
augroup FoldCode
  autocmd!
  autocmd VimEnter,BufWinEnter * silent! :set foldmethod=marker
augroup END
" }}}2
" --- テーマ ------------------------------------ {{{2
if (has('termguicolors'))
  set termguicolors  " ターミナルでも True Color を使えるようにする
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif

"set t_Co=256
" }}}2
" --- 背景透過 ---------------------------------- {{{2
augroup TransparentBackGround
  autocmd!
  autocmd VimEnter,ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  autocmd VimEnter,ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
  autocmd VimEnter,ColorScheme * highlight SpecialKey ctermbg=NONE guibg=NONE
  autocmd VimEnter,ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
  autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none guibg=NONE
  autocmd VimEnter,ColorScheme * highlight Folded ctermbg=none guibg=NONE
  autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none guibg=NONE
  autocmd ColorScheme * highlight VertSplit ctermbg=none guibg=NONE
  autocmd ColorScheme * highlight Split ctermbg=none guibg=None

  if !has('gui_running')
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SpecialKey ctermbg=none
    autocmd VimEnter,ColorScheme * highlight EndOfBuffer ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight Folded ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
  endif
augroup END
" }}}2
" }}}1

" ターミナル環境で波下線
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" =========================================================
"  keybindings                                         {{{1
" =========================================================
" == <Leader> / <LocalLeader> =================== {{{2
let mapleader = ' '
let maplocalleader = ','
" }}}3
" == normal mode ================================ {{{2
" --- 表示業単位で上下移動するように ----------- {{{3
"nnoremap j gj
"nnoremap k gk
"nnoremap <Up> gk
"nnoremap <Down> gj
" }}}3
" --- 現在の行を上下の行へ移動 ----------------- {{{3
nnoremap <C-J> ddp
nnoremap <C-K> ddkkp
" }}}3
" --- 行番号表示変更 --------------------------- {{{3
nnoremap <silent> <F3> :<C-u>setlocal relativenumber!<CR>
" }}}3
" --- 画面分割 --------------------------------- {{{3
nnoremap <silent> <C-w>- :split<CR>
nnoremap <silent> <C-w>\ :vs<CR>
inoremap <silent> <C-w>- :split<CR>
inoremap <silent> <C-w>\ :vs<CR>
vnoremap <silent> <C-w>- :split<CR>
vnoremap <silent> <C-w>\ :vs<CR>
" }}}3
" --- クオートを付ける ------------------------- {{{3
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" }}}3
" --- ESCキー2度押しで検索ハイライト削除 ------- {{{3
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" }}}3
" --- 行末空白削除・インデント整形 ------------- {{{3
nnoremap <silent> <leader>w :%s/\s\+$//ge<CR>:silent normal! mqgg=G`qzz<cr>
" }}}3
" --- 検索時に自動的に very match -------------- {{{3
nnoremap / /\v
nnoremap ? ?\v
" }}}3
" --- vimgrep ---------------------------------- {{{3
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 8<cr>
nnoremap <leader>] :cnext<cr>
nnoremap <leader>[ :cprevious<cr>
nnoremap <leader>} :<C-u>clast<cr>
nnoremap <leader>{ :<C-u>cfirst<cr>
" }}}3
" --- .vimrcを素早く開く ----------------------- {{{3
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}3
" --- <F5> ファイル実行 ------------------------ {{{3
augroup exec_file
  autocmd!
  autocmd FileType vim noremap <F5>  :source %<CR>
  autocmd FileType lua noremap <F5> <cmd>luafile %<CR>
  autocmd FileType perl noremap <F5>  :!perl %<CR>
  autocmd FileType javascript noremap <F5>  :!node %<CR>
  autocmd FileType ruby noremap <F5>  :!ruby %<CR>
  autocmd FileType sh noremap <F5>  :!sh %<CR>
  autocmd FileType python noremap <F5> :!python %<CR>
augroup END
" }}}3
" --- <F6> trivial file を開く ----------------- {{{3
function! CreateTrivialCode()
  if &filetype ==# 'sh'
    if ! glob('$HOME/.vim/trivial/trivial.sh')
      !touch $HOME/.vim/trivial/trivial.sh<CR>
      !chmod 755 $HOME/.vim/trivial/trivial.sh<CR>
    endif
    split $HOME/.vim/trivial/trivial.sh
  elseif &filetype ==# 'vim'
    split $HOME/.vim/trivial/trivial.vim
  elseif &filetype ==# 'lua'
    split $HOME/.vim/trivial/trivial.lua
  elseif &filetype ==# 'ruby'
    split $HOME/.vim/trivial/trivial.rb
  elseif &filetype ==# 'python'
    split $HOME/.vim/trivial/trivial.py
  elseif &filetype ==# 'javascript'
    split $HOME/.vim/trivial/trivial.js
  endif
endfunction
nnoremap <silent> <F6> :call CreateTrivialCode()<CR>gg0vG$d
" }}}3
" --- <F7> 空ファイルにする -------------------- {{{3
nnoremap <silent> <F7> gg0vG$d
" }}}3
" --- 方向キー禁止 ----------------------------- {{{3
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" }}}3
" }}}2
" == insert mode ================================ {{{2
" --- カーソル移動 ----------------------------- {{{3
inoremap <C-h> <left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-b> <BS>
inoremap <C-d> <C-o>dd
" }}}3
" --- escキーで半角入力へ (fcitx) -------------- {{{3
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
" }}}3
" --- <esc> ------------------------------------ {{{3
inoremap jk <esc>
inoremap <esc> <nop>
" }}}3
" --- <BS> / <Del> ------------------------------ {{{3
set backspace=indent,eol,start  " バックスペースキーの有効化
"inoremap <BS> <nop>
"inoremap <C-v> <Del>
" }}}3
" --- 現在のカーソル下の単語を大文字化する ----- {{{3
inoremap <silent> <C-u> <esc>viwUi
" }}}3
" --- 方向キーを使わないようにする ------------- {{{3
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" }}}3
" }}}2
" == markdown =================================== {{{2
augroup markdown_group
  autocmd!
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^\[-=]\\{2,}$\r:nohl\rkvg_"<cr>
augroup END
" }}}2
" }}}1

