require 'plugins' 

if not vim.o.readonly then
    require 'config.cmp'
    require 'config.neogit'
    require 'config.toggleterm'
    require 'config.tree'
    require 'config.neogit'
    require 'config.pairs'
    require 'config.mason'
end

require 'config.dap'
require 'config.go'
require 'config.theme'
require 'config.line'
require 'config.keys'
require 'config.lspconfig' 
require 'config.treesitter' 


local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4
o.nu = true
