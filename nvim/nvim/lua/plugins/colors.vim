
augroup MyColors
  autocmd!
  autocmd VimEnter,ColorScheme,BufEnter,WinNew * call SetMyColors()
  autocmd VimEnter,ColorScheme,BufEnter,WinNew * call SetMyColors_error()
  autocmd VimEnter,ColorScheme,BufEnter,WinNew * call SetMyColors_diff()
augroup END


function! SetMyColors() abort
  " 戻したほうがいいかもしれない
  highlight! Normal guifg=#9aa7bd
  highlight! TermCursor guibg=#9aa7bd
  highlight! Cursor guifg=#232936 guibg=#9aa7bd
  highlight! lCursor guifg=fg guibg=#9aa7bd
  highlight! MatchParen cterm=bold ctermbg=6 gui=bold guifg=#232936 guibg=#c47ebd

  highlight! Pmenu ctermbg=236 ctermfg=251 guibg=#3d425b guifg=#c6c8d1
  highlight! PmenuSbar ctermbg=236 ctermfg=NONE guibg=#3d425b guifg=NONE
  highlight! PmenuSel ctermbg=240 ctermfg=255 guibg=#5b6389 guifg=#eff0f4
  highlight! PmenuThumb ctermbg=251 ctermfg=NONE guibg=#c6c8d1 guifg=NONE

  highlight! StatusLine cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
  highlight! StatusLineTerm cterm=reverse ctermbg=234 ctermfg=245 gui=reverse guibg=#17171b guifg=#818596 term=reverse
  highlight! StatusLineNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117
  highlight! StatusLineTermNC cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117
  highlight! Split guifg=#17171b
  highlight! VertSplit guifg=#17171b

  highlight! Folded ctermfg=14 guifg=#51617d
  highlight! Comment ctermfg=14 guifg=#466e8a
  highlight! CursorLineNr ctermbg=NONE guibg=NONE
  highlight! ColorColumn ctermbg=0, guibg=#202227
  highlight! NonText ctermfg=14, guifg=#323c4d
  highlight! link SpecialKey NonText
  highlight! link EndOfBuffer NonText
  highlight! OperatorChars ctermfg=14 guifg=#466e8a

  highlight! RedrawDebugNormal cterm=reverse gui=reverse
  highlight! RedrawDebugClear ctermbg=11 guibg=#F0C674
  highlight! RedrawDebugComposed ctermbg=10 guibg=#B5BD68
  highlight! RedrawDebugRecompose ctermbg=9 guibg=#CC6666
endfunction

function! SetMyColors_error() abort
  highlight! ErrorMsg ctermbg=NONE guibg=NONE
  highlight! Error cterm=bold ctermfg=15 ctermbg=None gui=bold guifg=#b15e7c guibg=NONE
  highlight! SpellBad ctermbg=95 ctermfg=252 gui=undercurl guifg=NONE guisp=#e27878
  highlight! SpellCap ctermbg=24 ctermfg=252 gui=undercurl guifg=NONE guisp=#84a0c6
  highlight! spelllocal ctermbg=23 ctermfg=252 gui=undercurl guifg=none guisp=#89b8c2
  highlight! SpellRare ctermbg=97 ctermfg=252 gui=undercurl guifg=NONE guisp=#a093c7
  highlight! CocErrorHighlight cterm=undercurl gui=undercurl guisp=#e27878
  highlight! CocWarningHighlight cterm=undercurl gui=undercurl guisp=#e2a478
  highlight! CocUnderline cterm=undercurl gui=undercurl guisp=#9aa7bd
  highlight! CocErrorSign ctermfg=203 guifg=#e27878
  highlight! CocWarningSign ctermfg=216 guifg=#e2a478
  highlight! CocInfoSign ctermfg=228
  highlight! link ALEErrorSign CocErrorSign
  highlight! link ALEWarningSign CocWarningSign
  highlight! link ALEInfoSign CocInfoSign
  highlight! link ALEVirtualTextError CocErrorSign
  highlight! link ALEVirtualTextWarning CocWarningSign
endfunction

function! SetMyColors_diff() abort
  highlight! DiffAdd ctermfg=65 ctermbg=238 guifg=#cef473 guibg=#464632
  highlight! DiffChange ctermfg=81 ctermbg=239 guifg=#73cef4 guibg=#335261
  highlight! DiffDelete ctermfg=167 ctermbg=237 guifg=#f473ce guibg=#79313c
  highlight! DiffText ctermfg=234 ctermbg=110 guifg=#1d1f21 guibg=#81a2be
  highlight! link GitGutterAdd DiffAdd
  highlight! link GitGutterChange DiffChange
  highlight! link GitGutterDelete DiffDelete
  highlight! link GitGutterChangeDelete DiffChange
  highlight! link SignifySignAdd DiffAdd
  highlight! link SignifySignChange DiffChange
  highlight! link SignifySignDelete DiffDelete
  highlight! link SignifySignChangeDelete DiffChange
endfunction
" 193 #d7ffaf 189 #d7d7ff 234 #ffafaf 167 #cc6666 238 #5F875F

