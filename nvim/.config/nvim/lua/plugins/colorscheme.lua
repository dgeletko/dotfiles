return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = "macchiato",
    integrations = {
      harpoon = true,
      vimwiki = true,
      which_key = true,
    },
  },
  config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'catppuccin'
  end,
}

