return {
  -- Very simple vim plugin for easy resizing of your vim windows
  {
    'simeji/winresizer',
    keys = [[<C-e>]],
    setup = function()
      vim.g.winresizer_vert_resize = 2
      vim.g.winresizer_horiz_resize = 1
    end
  },

  -- dark powered shell for Neovim. It is based on neovim or Vim terminal feature.
  {
    'Shougo/deol.nvim',
    cmd = 'Deol',
    setup = function()
      -- <F4> ターミナルを表示
      vim.api.nvim_set_keymap('n', [[<F4>]], [[:<C-u>Deol -split=floating<cr>]],
      { noremap = true, silent = true })
      -- <esc> ターミナルモードから抜ける
      vim.api.nvim_set_keymap('t', [[<C-[>]], [[<C-\><C-n>]],
      { noremap = true, silent = true })
      -- <F4> ターミナルから一気に抜ける
      vim.api.nvim_set_keymap('t', [[<F4>]], [[<C-\><C-n><C-w>c]],
      { noremap = true, silent = true })
    end
  }
}
