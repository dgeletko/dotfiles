return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    --'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    require('telescope').setup()
    --pcall(require('telescope').load_exension, 'ui-select')
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find file' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'find live grep' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'find word' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'find buffer' })
    vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'find man page' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'find help' })
    vim.keymap.set('n', '<leader>fp', builtin.builtin, { desc = 'find picker' })
  end
}

