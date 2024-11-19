return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local oil = require('oil')
    oil.setup({ })
    vim.keymap.set('n', '-', oil.open_float, { desc = 'open parent directory' })
  end
}

