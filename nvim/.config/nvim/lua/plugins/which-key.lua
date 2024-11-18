return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = "modern",
    spec = {
      { '<leader>e', group = 'explore' },
      { '<leader>f', group = 'find' },
      { '<leader>w', group = 'wiki' },
    },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}

