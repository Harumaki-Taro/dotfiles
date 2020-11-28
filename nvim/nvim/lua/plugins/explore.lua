return {
  -- nerdtree
  {
    'preservim/nerdtree',
    config = function()
      vim.g.NERDTreeDirArrows = 1
      vim.g.NERDTreeWinSize = 22
      vim.g.NERDTreeShowHidden = 1
    end
  },

  -- nerdtree tab
  {
    'jistr/vim-nerdtree-tabs',
    requires = 'preservim/nerdtree',
    --cmd = 'NERDTreeTabsToggle',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>n', [[:NERDTreeTabsToggle<cr>]],
      { noremap = true, silent = true })
    end
  },

  -- nerdtree git plugin
  {
    'Xuyuanp/nerdtree-git-plugin',
    requires = 'preservim/nerdtree',
    config = function()
      vim.g.NERDTreeGitStatusIndicatorMapCustom = {
        Modified  = '',
        Staged    = '',
        Untracked = '',
        Renamed   = '',
        Unmerged  = '',
        Deleted   = '',
        Dirty     = '',
        Ignored   = '',
        Clean     = '',
        Unknown   = '',
      }
    end
  },

  -- nerdtree syntax highlight
  {
    'tiagofumo/vim-nerdtree-syntax-highlight',
    requires = 'preservim/nerdtree',
    setup = function()
      vim.g.NERDTreeLimitedSyntax = 1
      rspec_red = 'FE405F'
      git_orange = 'F54D27'
      vim.g.NERDTreeExactMatchHighlightColor = {
        ['.gitignore'] = git_orange
      }
      vim.g.NERDTreePatternMatchHighlightColor = {
        ['.*_spec.rb$'] = rspec_red
      }
    end
  },

  -- ranger
  {
    'iberianpig/ranger-explorer.vim',
    requires = 'preservim/nerdtree',
    cmd = {'RangerOpenCurrentDir', 'RangerOpenProjectRootDir'},
    setup = function()
      vim.api.nvim_set_keymap('n', [[<Leader>rc]], [[:RangerOpenCurrentDir<cr>]],
      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', [[<Leader>rr]], [[:RangerOpenProjectRootDir<cr>]],
      { noremap = true, silent = true })
    end
  },

  -- ctag の情報を右側に表示
  {
    'preservim/tagbar',
    cmd = 'TagbarToggle',
    setup = function()
      vim.api.nvim_set_keymap('n', '<F8>', [[:TagbarToggle<cr>]],
      { noremap = true, silent = false })
    end
  }
}

