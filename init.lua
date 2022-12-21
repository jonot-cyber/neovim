require 'plugins' 

-- require 'config.toggleterm'
-- require 'config.tree'
require 'config.pairs'
require 'config.mason'
-- require 'config.dap'
-- require 'config.go'
-- require 'config.snippets'
-- require 'config.cmp'
require 'config.latex'
-- require 'config.fold'
-- require 'config.theme'
require 'config.line'
require 'config.keys'
require 'config.lspconfig' 
require 'config.treesitter' 
require 'config.surround'


local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4
o.nu = true
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.cmd [[colorscheme catppuccin]]
