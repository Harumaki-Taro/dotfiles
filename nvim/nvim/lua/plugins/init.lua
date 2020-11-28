-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  -- a great asynchronous execution library for Vim
  use {
    'Shougo/vimproc.vim',
    run = function()
      os.execute(make)
    end
  }

  -- モジュールにする場合は、1ファイルにつき2パッケージ以上ないとエラーが出る
  local module_table = {
    "git", "theme", "linter", "explore", "save", "window", "completion", "lang", "util", "miscellaneous"
  }

  for _, path in pairs(module_table) do
    use(require('plugins.' .. path))
  end
end)
