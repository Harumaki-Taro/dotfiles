return {
  -- vim cheat sheet
  {
    'reireias/vim-cheatsheet',
    cmd = 'Cheat',
    setup = function()
      vim.cmd([[
      let g:cheatsheet#cheat_file = '$HOME/.config/nvim/cheatsheet.md'
      let g:cheatsheet#float_window = 1
      " you can change float window size.
      let g:cheatsheet#float_window_width_ratio = 0.8
      let g:cheatsheet#float_window_height_ratio = 0.8
      ]])

      vim.api.nvim_set_keymap('n', [[<F2>]], [[:Cheat<cr>]],
      { noremap = true, silent = true })
    end
  },

  -- 日本語に翻訳した Vim 付属のヘルプ
  {
    'vim-jp/vimdoc-ja',
    config = function()
      vim.api.nvim_set_option('helplang', 'ja,en')
    end
  }
}
