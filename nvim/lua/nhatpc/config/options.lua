vim.o.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 5

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set list option to display invisible characters
vim.opt.list = true

-- Set listchars to display spaces as middle dot
vim.api.nvim_set_option('listchars', 'space:·')

vim.opt.colorcolumn = "120"
