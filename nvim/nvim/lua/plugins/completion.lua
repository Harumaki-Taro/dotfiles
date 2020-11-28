return {
  -- Auto close parentheses and repeat by dot dot dot...
  {
    'cohama/lexima.vim',
    event = 'InsertEnter *'
  },

  -- helps to end certain structures automatically.
  {
    'tpope/vim-endwise',
    disable = true,
  },

  -- snipMate & UltiSnip Snippets
  {
    'honza/vim-snippets',
    event = 'InsertEnter *'
  }
}

