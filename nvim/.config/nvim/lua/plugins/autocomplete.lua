return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    --'l3mon4d3/luasnip',
  },
  opts = {
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
    },
    completion = { completeopt = 'menu,menuone,noinsert' },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    --mapping = require('cmp').mapping.preset.insert({ }),
  },
}

