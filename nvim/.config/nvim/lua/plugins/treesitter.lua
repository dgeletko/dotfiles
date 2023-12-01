return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require('nvim-treesitter.configs')
    configs.setup({
      ensure_installed = {'bash', 'c', 'cmake', 'cpp', 'dockerfile', 'lua', 'make', 'meson', 'vim', 'python', 'yaml'},
    })
  end
}

