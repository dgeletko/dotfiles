return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'l3mon4d3/luasnip'
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps( { buffer = bufnr } )
    end)

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {'lua_ls', 'clangd'},
      handlers = {
        lsp_zero.default_setup,
      },
    })

    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          workspace = {
            ignoreSubmodules = false,
            checkThirdParty = false,
          },
        },
      },
    })
    --require('lspconfig').clangd.setup()
    lsp_zero.setup_servers({'lua_ls', 'clangd'})

    local cmp = require('cmp')
    cmp.setup({
      sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
      },
      formatting = lsp_zero.cmp_format(),
    })
  end
}

