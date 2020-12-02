return {
  -- Iceberg is well-designed, bluish color scheme for Vim and Neovim.
  {
    'cocopon/iceberg.vim',
    config = function()
      --vim.o.background = 'dark'
      --vim.cmd('colorscheme iceberg')
    end
  },

  -- color scheme
  {
    'w0ng/vim-hybrid',
    disable = true,
    config = function()
      vim.o.background = 'dark'
      vim.cmd('let color="dark"')
      vim.cmd('colorscheme hybrid')
    end
  },

  {
    'tyrannicaltoucan/vim-deep-space',
    --disable = true,
    config = function()
      vim.o.background = 'dark'
      vim.g.deepspace_italic = 1
      vim.cmd('colorscheme deep-space')
      vim.cmd('source $HOME/.config/nvim/lua/plugins/colors.vim')
    end
  },

  {
    'sainnhe/edge',
    disable = true,
    config = function()
      vim.o.background = 'dark'
      vim.g.edge_enable_italic = 1
      vim.g.edge_style = 'aura'
      vim.cmd('colorscheme edge')
    end
  },

  {
    'morhetz/gruvbox',
    disable = true,
    config = function()
      vim.o.background = 'dark'
      vim.g.gruvbox_italic = 1
      vim.cmd('colorscheme gruvbox')
    end
  },

  -- file icons
  {
    'cj/vim-webdevicons',
    config = function()
      vim.g.WebDevIconsUnicodeGlyphDoubleWidth = 1
      -- vim-devicons
      vim.g.webdevicons_conceal_nerdtree_brackets = 1
      vim.g.WebDevIconsNerdTreeAfterGlyphPadding = ' '

      -- dir-icons
      vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
      vim.g.DevIconsEnableFoldersOpenClose = 1
      vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
      vim.g.DevIconsDefaultFolderOpenSymbol = ''
      vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = { html = '', css = '', md = '', txt = '', erb='' }
      vim.g.WebDevIconsUnicodeDecorateFileNodesExactSymbols = { ['todo.txt'] = '', ['archive.txt'] = '' }
    end
  },

  -- lightline
  {
    'itchyny/lightline.vim',
    requires = {
      'ryanoasis/vim-devicons',
      'tpope/vim-fugitive',
      'airblade/vim-gitgutter',
      'cocopon/iceberg.vim'
    },
    config = function()
      vim.g.webdevicons_enable_flagship_statusline = 1
      vim.g.laststatus = 2 -- 常にステータスラインを表示

      vim.cmd('source $HOME/.config/nvim/lua/plugins/config-lightline.vim')
    end
  },

  -- displaying thin vertical lines at each indentation level for code indented with spaces
  {
    'Yggdroot/indentLine',
    -- event = 'InsertEnter *',
    config = function()
      vim.g.indentLine_char = '┆'
      --vim.g.indentLine_color_term = 0
      --vim.g.indentLine_color_gui = '#202227'
      vim.g.indentLine_defaultGroup = 'LineNr'
      vim.g.indentLine_faster = 1
      vim.g.indentLine_concealcursor = 'inc'
      vim.g.indentLine_conceallevel = 2
      vim.g.indentLine_bufNameExclude = { '_.*', 'NERD_tree.*', '*.wiki' }
      vim.g.indentLine_fileTypeExclude = { 'vimwiki' }
      vim.g.indentLine_bufTypeExclude = { 'help', 'terminal', 'vimwiki' }
    end
  }
}

