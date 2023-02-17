--[[
         )     )    )          
      ( /(  ( /( ( /(   *   )  
   (  )\()) )\()))\())` )  /(  
   )\((_)\ ((_)\((_)\  ( )(_)) 
  ((_) ((_) _((_) ((_)(_(_())  
 _ | |/ _ \| \| |/ _ \|_   _|  
| || | (_) | .` | (_) | | |    
 \__/ \___/|_|\_|\___/  |_|    

 Hey there, this is my Neovim configuration. :)
]]

require("config.plugins") -- This is where all of my plugins are configured

vim.o.expandtab = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.nu = true
vim.o.number = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shell = "/usr/bin/bash"

vim.cmd("colorscheme tokyonight-moon") -- This is the theme I prefer right now
