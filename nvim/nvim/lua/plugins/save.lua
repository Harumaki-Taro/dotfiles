return {
  -- AutoSave - automatically save changes to disk without having to use :w
  {
    'vim-scripts/vim-auto-save',
    opt = false,
    config = function()
      vim.g.auto_save_silent = 1
      -- do not change the 'updatetime' option
      vim.g.auto_save_no_updatetime = 1
      -- do not save while in insert mode
      vim.g.auto_save_in_insert_mode = 0

      -- git commit時に自動保存されないようにする
      current_path = vim.fn.expand([[%:p]])
      if current_path == nil then
        current_path = ''
      end
      if string.find(current_path, 'COMMIT_EDITMSG') then
        vim.g.auto_save = 0
      else
        vim.g.auto_save = 1
      end

    end
  },

  -- Useful mksession
  {
    'tpope/vim-obsession'
  }
}
