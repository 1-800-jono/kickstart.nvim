return {
  'olimorris/codecompanion.nvim',
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
      },
    }
    vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<LocalLeader>a', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd [[cab cc CodeCompanion]]
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
