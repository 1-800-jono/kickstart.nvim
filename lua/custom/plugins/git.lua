return {
  {
    'f-person/git-blame.nvim',
    event = 'BufRead',
    config = function()
      vim.cmd 'highlight default link gitblame SpecialComment'
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_date_format = '%r'
      -- vim.g.gitblame_ignored_filetypes = { 'lua' }
    end,
  },
  {
    'rhysd/git-messenger.vim',
    config = function()
      -- vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_floating_win_opts = { border = 'single' }
      vim.g.git_messenger_popup_content_margins = true
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
