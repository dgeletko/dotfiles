-- leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- spacing/indentation
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc
vim.opt.undofile = true

-- ui
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '100'
vim.opt.cursorline = true

vim.schedule(
  function()
    vim.opt.clipboard = 'unnamedplus'
  end
)

