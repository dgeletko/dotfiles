return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cmake',
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

