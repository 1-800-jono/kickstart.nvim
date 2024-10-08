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
      local HEIGHT_RATIO = 0.8 -- You can change this
      local WIDTH_RATIO = 0.8 -- You can change this too
      require('nvim-tree').setup {
        view = {
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2 - vim.opt.cmdheight:get())
              return {
                border = 'rounded',
                relative = 'editor',
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
        hijack_unnamed_buffer_when_opening = true,
        disable_netrw = true, -- disable :Explore
        hijack_directories = {
          enable = true,
          auto_open = false,
        },
      }
      vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { silent = true })
      vim.cmd.hi 'NvimTreeNormalFloat guibg=none'
    end,
  },
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
        -- NvimTree = true,
        -- Or, specify the text used for the offset:
        -- undotree = {
        --   text = 'undotree',
        --   align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        -- },
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
