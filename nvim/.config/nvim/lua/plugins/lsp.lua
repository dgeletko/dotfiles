return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {'williamboman/mason.nvim', config = true},
    {'saghen/blink.cmp', version = '1.*', opts = {}},
  },
  config = function()
    vim.lsp.enable({'clangd', 'lua_ls', 'pylsp'})
  end
}

