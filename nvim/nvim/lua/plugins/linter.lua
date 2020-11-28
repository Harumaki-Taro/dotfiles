return {
  -- coc.nvim
  {
    'neoclide/coc.nvim',
    event = 'InsertEnter *',
    run = './install.sh nightly',
    -- coc diagnostics indicator for the lightline vim plugin.
    config = function()
      vim.g.coc_global_extensions = {
        'coc-snippets', 'coc-solargraph', 'coc-json', 'coc-html', 'coc-css', 'coc-lua', 'coc-java',
        'coc-markdownlint', 'coc-toml', 'coc-sh'
      }

      vim.cmd('source $HOME/.vim/rc/coc-setting.vim')
      vim.cmd('source $HOME/.config/nvim/lua/plugins/config-coc.vim')

      -- coc-vimlsp
      vim.g.markdown_fenced_languages = { 'vim', 'help' }
    end,
    requires = {
      {
        'josa42/vim-lightline-coc',
        setup = function()
          vim.cmd('let g:lightline#coc#indicator_errors = " "')
          vim.cmd('let g:lightline#coc#indicator_warnings = " "')
          vim.cmd('let g:lightline#coc#indicator_info = " "')
          vim.cmd('let g:lightline#coc#indicator_hints = " "')
          vim.cmd('let g:lightline#coc#indicator_ok = " "')
        end
      }
    }
  },

  -- coc-nvim-lua
  {
    'rafcamlet/coc-nvim-lua',
    requires = 'neoclide/coc.nvim',
    ft = 'lua'
  },

  -- coc-toml
  {
    'kkiyama117/coc-toml',
    run = 'yarn install --frozen-lockfile',
    requires = 'neoclide/coc.nvim',
    ft = 'toml',
    branch = 'develop'
  },

  -- ale
  {
    'dense-analysis/ale',
    cmd = 'ALEEnableBuffer',
    setup = function()
      vim.api.nvim_set_keymap('n', [[<F12>]], [[:ALEEnableBuffer<cr>]],
      { noremap = true, silent = true })

      vim.g.ale_set_highlights = 1
      vim.g.ale_sign_error = ' '
      vim.g.ale_sign_warning = ' '
      vim.g.ale_sign_info = ' '
      vim.g.ale_echo_msg_error_str = 'E'
      vim.g.ale_echo_msg_warning_str = 'W'
      vim.g.ale_echo_msg_info_str = 'I'
      vim.g.ale_echo_msg_format = '[%linter%:%severity%] %s %(code)%'
      -- Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
      vim.api.nvim_set_keymap('n', [[<tab>k]], [[<Plug>(ale_previous_wrap)]],
      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', [[<tab>j]], [[<Plug>(ale_next_wrap)]],
      { noremap = true, silent = true })
    end,
    requires = {
      {
        -- ALE indicator for the lightline vim plugin.
        'maximbaz/lightline-ale',
        after = {'ale', 'lightline.vim'},
        setup = function()
          vim.cmd('let g:lightline#ale#indicator_errors = " "')
          vim.cmd('let g:lightline#ale#indicator_warnings = " "')
          vim.cmd('let g:lightline#ale#indicator_infos = " "')
          vim.cmd('let g:lightline#ale#indicator_checking = " "')
          vim.cmd('let g:lightline#ale#indicator_ok = " "')
        end
      }
    }
  }
}

