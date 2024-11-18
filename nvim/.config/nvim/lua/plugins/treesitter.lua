return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'c_sharp',
      'cpp',
      'dockerfile',
      'json',
      'lua',
      'make',
      'meson',
      'python',
      'vim',
      'xml',
      'yaml',
    },
    highlight = {
      enable = true,
    },
  },
}

