return {
  'folke/which-key.nvim',
  config = true,
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require('which-key')
    wk.register({
      e = { name = 'explore' },
      f = { name = 'find' },
      w = { name = 'wiki' },
    }, { prefix = '<leader>' })
  end
}

