let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [
      \     [ 'active_fake', 'mode', 'paste' ],
      \     [ 'coc_errors', 'coc_warnings',  'coc_info', 'coc_hints', 'ale_errors', 'ale_warnings',
      \       'ale_infos', 'fugitive', 'gitgutter' ],
      \     [ 'filepath_modified', 'currentfunction' ],
      \   ],
      \   'right': [
      \     [ 'percent' ],
      \     [ 'lineinfo' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ]
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     ['inactive_fake'], [],
      \     [ 'mode', 'fugitive', 'filepath_modified' ]
      \   ],
      \   'right': [
      \     [],[],
      \     [ 'percent' ]
      \   ]
      \ },
      \ }

let g:lightline.component_function = {
      \   'active_fake'      : 'LL_Active_Fake',
      \   'inactive_fake'    : 'LL_Inactive_Fake',
      \   'mode'             : 'LL_Mode',
      \   'fugitive'         : 'LL_Fugitive',
      \   'gitgutter'        : 'LL_GitGutter',
      \   'modified'         : 'LL_Modified',
      \   'filepath'         : 'LL_FilePath',
      \   'filepath_modified': 'LL_FilePath_Modified',
      \   'currentfunction'  : 'LL_CurrentFunction',
      \   'percent'          : 'LL_Percent',
      \   'lineinfo'         : 'LL_LineInfo',
      \   'fileformat'       : 'LL_FileFormat',
      \   'fileencoding'     : 'LL_FileEncoding',
      \   'filetype'         : 'LL_FileType',
      \ }

let g:lightline.component_expand = {
      \   'coc_errors'  : 'lightline#coc#errors',
      \   'coc_warnings': 'lightline#coc#warnings',
      \   'coc_info'    : 'lightline#coc#info',
      \   'coc_hints'   : 'lightline#coc#hints',
      \   'coc_status'  : 'lightline#coc#status',
      \   'ale_checking': 'lightline#ale#checking',
      \   'ale_errors'  : 'lightline#ale#errors',
      \   'ale_warnings': 'lightline#ale#warnings',
      \   'ale_infos'   : 'lightline#ale#infos',
      \ }

" Set color to the components:
let g:lightline.component_type = {
      \   'coc_warnings': 'warning',
      \   'coc_errors'  : 'error',
      \   'coc_info'    : 'info',
      \   'coc_hints'   : 'hints',
      \   'ale_infos'   : 'info',
      \   'ale_warnings': 'warning',
      \   'ale_errors'  : 'error',
      \ }

let s:space_width = 2

function! LL_Active_Fake()
  let l:window_length = winwidth('.')
  let l:rest_length = l:window_length

  let b:ll_mode = ''
  let b:ll_filepath_modified = ''
  let b:ll_fugitive = ''
  let b:ll_gitgutter = ''
  let b:ll_lineinfo = ''
  let b:ll_percent = ''
  let b:ll_fileformat = ''
  let b:ll_filetype = ''
  let b:ll_fileencoding = ''
  let b:ll_currentfunction = ''

  " mode
  let l:rest_length -= LL_Mode_()

  if l:window_length <= 50
    return ''
  endif

  " percent
  let l:rest_length -= LL_Percent_()

  " lineinfo
  let l:rest_length -= LL_LineInfo_()

  " fugitive
  let l:rest_length -= LL_Fugitive_()
  " gitgutter
  let l:rest_length -= LL_GitGutter_()

  "" linter
  let l:rest_length -= LL_Linter_()

  " filepath & modified
  " fileformatとfileencodingのwebicon分だけ残しておく
  let l:_ = l:rest_length
  let l:rest_length -= LL_FilePath_Modified_(l:_, v:true)

  " fileinfo
  let l:_ = l:rest_length
  let l:rest_length -= LL_FileInfo_(l:_)

  " currentfunction
  let l:_ = l:rest_length
  let l:rest_length -= LL_CurrentFunction_(l:_)

  return ''
endfunction



function! LL_Inactive_Fake()
  let l:window_length = winwidth('.')
  let l:rest_length = l:window_length

  let b:ll_mode = ''
  let b:ll_filepath_modified = ''
  let b:ll_fugitive = ''
  let b:ll_gitgutter = ''
  let b:ll_percent = ''
  let b:ll_fileformat = ''
  let b:ll_filetype = ''
  let b:ll_fileencoding = ''

  if l:window_length <= 50
    let l:rest_length -= LL_Mode_()
    return ''
  endif

  " percent
  let l:rest_length -= LL_Percent_()

  " fugitive
  let l:rest_length -= LL_Fugitive_()

  " filepath & modified
  " fileformatとfileencodingのwebicon分だけ残しておく
  let l:_ = l:rest_length
  let l:rest_length -= LL_FilePath_Modified_(l:_, v:false)

  return ''
endfunction



" mode ------------------------ {{{
function! LL_Mode()
  return b:ll_mode
endfunction

function! LL_Mode_()
  if &filetype =~# 'help\|vimfiler\|gundo\|nerdtree\|tagbar\|packer\|fugitive'
    let b:ll_mode = toupper(&filetype)
  else
    let b:ll_mode = lightline#mode()
  endif

  return strlen(b:ll_mode) + s:space_width
endfunction
" }}}

" percent --------------------- {{{
function! LL_Percent()
  return b:ll_percent
endfunction

function! LL_Percent_()
  let b:ll_percent = printf('%3d%%', (100 * line('.') / line('$')))
  return strlen(b:ll_percent) + s:space_width
endfunction
" }}}

" lineinfo --------------------- {{{
function! LL_LineInfo()
  return b:ll_lineinfo
endfunction

function! LL_LineInfo_()
  let b:ll_lineinfo = printf('(%3d)%3d:%-2d', line('$'), line('.'), col('.'))
  return strlen(b:ll_lineinfo) + s:space_width
endfunction
" }}}

" fugitive --------------------- {{{
function! LL_Fugitive()
  return b:ll_fugitive
endfunction

function! LL_Fugitive_()
  if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    let b:ll_fugitive = '' . fugitive#head()
    return strlen(b:ll_fugitive) + s:space_width
  else
    let b:ll_fugitive = ''
    return 0
  endif
endfunction
" }}}

" gitgutter ------------------- {{{
function! LL_GitGutter()
  return b:ll_gitgutter
endfunction

function! LL_GitGutter_()
  if ! exists('*GitGutterGetHunkSummary') || ! get(g:, 'gitgutter_enabled', 0)
    let b:ll_gitgutter = ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added,
        \ g:gitgutter_sign_modified,
        \ g:gitgutter_sign_removed
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  let b:ll_gitgutter = join(ret, ' ')

  if strlen(b:ll_gitgutter) ==# 0
    return 0
  else
    return strlen(b:ll_gitgutter) + s:space_width
  endif
endfunction
" }}}

" linter ------------------- {{{
function! LL_Linter_()
  return 10
endfunction
" }}}

" filepath & modified --------- {{{
function! LL_FilePath_Modified()
  return b:ll_filepath_modified
endfunction

function! LL_Modified_()
  let b:ll_modified = &modified ? '[+]' : &modifiable ? '' : '[-]'
  return strlen(b:ll_modified)
endfunction

function! LL_FilePath_(length, active)
  let l:relative_path = expand('%:s')
  let l:filename = expand('%:t')

  if l:relative_path ==# ''
    let l:relative_path = '[No Name]'
    let l:filename = '[No Name]'
  endif

  if &filetype =~# 'help\|vimfiler\|gundo\|nerdtree\|tagbar\|packer'
    if a:active
      let l:relative_path = ''
      let l:filename = ''
    else
      let l:relative_path = toupper(&filetype)
      let l:filename = toupper(&filetype)
    endif
  endif

  if strlen(l:relative_path) <= a:length
    let b:ll_filepath = l:relative_path
  else
    if strlen(l:filename) <= a:length
      let b:ll_filepath = l:filename
    else
      let b:ll_filepath = l:filename[0:(a:length-2)] . '~'
    endif
  endif

  return strlen(b:ll_filepath)
endfunction

function! LL_FilePath_Modified_(length, active)
  let l:separator = ' '
  let l:_ = LL_FilePath_(a:length - LL_Modified_() - strlen(l:separator), a:active)
  let b:ll_filepath_modified = b:ll_filepath . l:separator . b:ll_modified
  return l:_ + s:space_width
endfunction
" }}}

" fileinfo -------------------------- {{{
function! LL_FileFormat()
  return b:ll_fileformat
endfunction

function! LL_FileEncoding()
  return b:ll_fileencoding
endfunction

function! LL_FileType()
  return b:ll_filetype
endfunction

function! LL_FileInfo_(length)
  let b:ll_fileformat = WebDevIconsGetFileFormatSymbol() . ' ' . &fileformat
  let b:ll_fileencoding = (strlen(&fileencoding) ? &fileencoding : 'unk enc')
  let b:ll_filetype = (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'unk ft')
  let l:_ = strlen(b:ll_fileformat) + strlen(b:ll_fileencoding) + strlen(b:ll_filetype)

  if l:_ + 3 * s:space_width <= a:length
    return l:_
  else
    let b:ll_fileencoding = ''

    if a:length > 2 * (2 + s:space_width)
      let b:ll_fileformat = WebDevIconsGetFileFormatSymbol()
      let b:ll_filetype = WebDevIconsGetFileTypeSymbol()
    else
      let b:ll_fileformat = ''
      let b:ll_filetype = ''
    endif

    return strlen(b:ll_fileformat) + strlen(b:ll_fileencoding) + strlen(b:ll_filetype) + s:space_width * 3
  endif
endfunction
" }}}

" currentfunction ----------------------- {{{
function! LL_CurrentFunction()
  return b:ll_currentfunction
endfunction

function! LL_CurrentFunction_(length)
  let b:ll_currentfunction = get(b:, 'coc_current_function', '')
  if strlen(b:ll_currentfunction) > a:length
    let b:ll_currentfunction = ''
  endif

  if strlen(b:ll_currentfunction) ==# 0
    return 0
  else
    return strlen(b:ll_currentfunction) + s:space_width
  endif
endfunction
" }}}



let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

let g:lightline.tab_component_function = {
      \ 'filename': 'TabFileName',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'lightline#tab#tabnum' }

function! TabFileName(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let t:filename = expand('#'.buflist[winnr - 1].':f')
  let t:filetypeicons = WebDevIconsGetFileTypeSymbol(t:filename)
  let t:filename = t:filename ==# '' ? '[No Name]' : t:filename
  return t:filetypeicons . ' ' . pathshorten(t:filename)
endfunction

