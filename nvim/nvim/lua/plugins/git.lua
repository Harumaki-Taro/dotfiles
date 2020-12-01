return {
  -- the premier Vim plugin for Git
  {
    'tpope/vim-fugitive',
    config = function()
      vim.api.nvim_set_keymap('n', [[gs]], [[:Gstatus<cr><C-w>T]],
      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', [[gps]], [[:Gpush<cr>]],
      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', [[gpl]], [[:Gpull<cr>]],
      { noremap = true, silent = true })
    end
  },

  -- git gutter
  {
    'airblade/vim-gitgutter',
    config = function()
      vim.g.gitgutter_max_signs = -1
      vim.wo.signcolumn = 'yes'
      vim.g.gitgutter_sign_added = '+'
      vim.g.gitgutter_sign_modified = '~'
      vim.g.gitgutter_sign_removed = '-'
      vim.g.citgutter_sign_modified_removed = '≃'
      --vim.g.gitgutter_sign_removed_first_line = '^^'
      --vim.g.gitgutter_sign_removed_above_and_below = '{'

      vim.g.gitgutter_preview_win_floating = 1

      --vim.cmd('source $HOME/.config/nvim/lua/plugins/config-git.vim')
    end
  },

  -- to reveal the hidden message from Git under the cursor quickly
  {
    'rhysd/git-messenger.vim',
    opt = true,
    cmd = 'GitMessenger',
    keys = [[<Plug>(git-messenger]]  -- default: nmap <Leader>gm <Plug>(git-messenger)
  }
}

