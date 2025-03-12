return {
  'olimorris/persisted.nvim',
  event = 'BufReadPre', -- Ensure the plugin loads only when a buffer has been loaded
  opts = {
    use_git_branch = true, -- Include the git branch in the session file name?
    autoload = true, -- Automatically load the session for the cwd on Neovim startup?
  },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
}
