return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'find file' })
    vim.keymap.set('n', '<leader>fr', telescope.oldfiles, { desc = 'find recent' })
    vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'find buffer' })
    vim.keymap.set('n', '<leader>fh', telescope.man_pages, { desc = 'find help' })
    vim.keymap.set('n', '<leader>fp', telescope.builtin, { desc = 'find picker' })
  end
}
