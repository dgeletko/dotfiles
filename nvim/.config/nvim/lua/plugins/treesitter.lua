return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  --main = 'nvim-treesitter.configs',
  --config = function()
  --    local ts = require("nvim-treesitter")
  --    ts.install({
  --        'bash',
  --        'c',
  --        'cmake',
  --        'cpp',
  --        'dockerfile',
  --        'json',
  --        'lua',
  --        'make',
  --        'meson',
  --        'python',
  --        'vim',
  --        'xml',
  --        'yaml',
  --    })
  --end,
  --opts = {
  --  ensure_installed = {
  --    'bash',
  --    'c',
  --    'cmake',
  --    'cpp',
  --    'dockerfile',
  --    'json',
  --    'lua',
  --    'make',
  --    'meson',
  --    'python',
  --    'vim',
  --    'xml',
  --    'yaml',
  --  },
  --  highlight = {
  --    enable = true,
  --  },
  --},
}

