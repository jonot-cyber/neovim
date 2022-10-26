require 'plugins' 

require 'config.cmp' 
require 'config.theme'
require 'config.line'
require 'config.keys'
require 'config.mason'
require 'config.pairs'
require 'config.neogit'
require 'config.lspconfig' 
require 'config.treesitter' 
require 'config.tree' 

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

