-- remove highlights
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'remove search highlights' })

-- open quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostic quickfix list' })

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to upper window' })

