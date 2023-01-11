require("config.plugins")

vim.o.expandtab = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.nu = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4

vim.cmd("colorscheme catppuccin")
