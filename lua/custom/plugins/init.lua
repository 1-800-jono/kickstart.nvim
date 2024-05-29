-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
      vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { silent = true })
    end,
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function() -- This is the function that runs, AFTER loading
  --     local bufferline = require 'bufferline'
  --     bufferline.setup {
  --       options = {
  --         mode = 'buffers', -- set to "tabs" to only show tabpages instead
  --         style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
  --         themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
  --         numbers = 'both',
  --         close_command = 'bdelete! %d', -- can be a string | function, | false see "Mouse actions"
  --         right_mouse_command = 'bdelete! %d', -- can be a string | function | false, see "Mouse actions"
  --         left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
  --         middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
  --         indicator = {
  --           icon = '▎', -- this should be omitted if indicator style is not 'icon'
  --           style = 'icon', -- | 'underline' | 'none',
  --         },
  --         buffer_close_icon = '󰅖',
  --         modified_icon = '●',
  --         close_icon = '',
  --         left_trunc_marker = '',
  --         right_trunc_marker = '',
  --         offsets = {
  --           {
  --             filetype = 'NvimTree',
  --             text = 'File Explorer',
  --             text_align = 'center',
  --             separator = true,
  --           },
  --         },
  --         color_icons = true, -- whether or not to add the filetype icon highlights
  --         diagnostics = 'nvim_lsp',
  --         diagnostics_indicator = function(count, level, diagnostics_dict, context)
  --           local icon = level:match 'error' and ' ' or ' '
  --           return ' ' .. icon .. count
  --         end,
  --       },
  --     }
  --   end,
  -- },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- insert_at_start = true,
      animation = false,
      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = {
          text = 'undotree',
          align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        -- Or, specify the event which the sidebar executes when leaving:
        -- ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify all three
        -- Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- Git
  {
    'f-person/git-blame.nvim',
    event = 'BufRead',
    config = function()
      vim.cmd 'highlight default link gitblame SpecialComment'
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_ignored_filetypes = { 'lua' }
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

  -- Vim
  { 'tpope/vim-surround' },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     { "nvim-telescope/telescope-live-grep-args.nvim" },
  --   },
  --   config = function()
  --     require("telescope").load_extension("live_grep_args")
  --   end
  -- },
  { 'slim-template/vim-slim' },
  { 'slm-lang/vim-slm' },
  { 'typicode/bg.nvim', lazy = false },
  { 'kchmck/vim-coffee-script' },
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup {
        api_key_cmd = '$OPENAI_API_KEY',
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
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
