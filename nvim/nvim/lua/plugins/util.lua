return {
  -- nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "maintained",
        -- Consistent syntax highlighting.
        highlight = {
          enable = true,              -- false will disable the whole extension
          disable = {},  -- list of language that will be disabled
          use_languagetree = false, -- Use this to enable language injection (this is very unstable)
          custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
          },
        },
        -- Treesitter based indentation (= vim behavior)
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        -- Treesitter based indentation (= vim behavior)
        indent = {
          enable = true
        }
      }

      -- Syntax based code folding
      vim.cmd([[set foldmethod=expr]])
      vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
    end
  },

  -- dark powered plugin for Neovim/Vim to unite all interfaces
  {
    'Shougo/denite.nvim'
  },

  -- Vim-CtrlSpace
  {
    'vim-ctrlspace/vim-ctrlspace',
    disable = true
  },

  -- Vim motion on speed!
  {
    'easymotion/vim-easymotion'
  },

  {
    'junegunn/vim-easy-align',
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)',
      { noremap = true, silent = false })
      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)',
      { noremap = true, silent = false })
    end
  },

  -- Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
  {
    'tpope/vim-surround'
  },

  -- comment/uncomment (can work with Shougo/context_filetype.vim)
  {
    'tyru/caw.vim',
    config = function()
      vim.api.nvim_set_keymap('n', [[<C-/>]], [[<Plug>(caw:{action}:{method}:operator)]],
      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', [[<C-/>]], [[<Plug>(caw:{action}:{method}:operator)]],
      { noremap = true, silent = true })
    end
  },

  -- todo.txt
  {
    'sietse/todo.txt-vim'
  },

  -- Distraction-free writing in Vim.
  {
    'junegunn/goyo.vim',
    cmd = 'Goyo'
  }
}
