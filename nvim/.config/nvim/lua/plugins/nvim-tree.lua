return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require('nvim-tree').setup()
    vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = 'toggle file explorer' })
    vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<cr>', { desc = 'find file in file explorer' })
    vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<cr>', { desc = 'collapse file explorer' })
    vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'refresh file explorer' })
  end
}
