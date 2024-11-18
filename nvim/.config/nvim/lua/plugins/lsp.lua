return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    --'j-hui/fidget.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'lsp: ' .. desc })
        end

        map('n', 'gd', vim.lsp.buf.definition, 'goto definition')
        map('n', 'gD', vim.lsp.buf.declaration, 'goto declaration')
        map('n', 'gr', require('telescope.builtin').lsp_references, 'goto references')
        map('n', 'gh', vim.lsp.buf.hover, 'goto help')
        map('n', '<leader>rn', vim.lsp.buf.rename, 'rename variable')
        map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, 'code action')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      clangd = {},

      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              ignoreSubmodules = false,
              checkThirdParty = false,
            },
          },
        },
      },

      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { 'W391' },
                maxLineLength = 100,
              },
            },
          },
        },
      },
    }

    require('mason-lspconfig').setup({
      ensure_installed = vim.tbl_keys(servers or {}),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end
}

