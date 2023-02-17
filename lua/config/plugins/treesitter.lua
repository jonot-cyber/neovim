--[[
-- treesitter is a package that parses code for stuff, including nicer colors. Very good, me like.
--]]
local M = {}

M.ensure_installed = "all" -- Automatically install all parsers because I want to.

M.highlight = {
    enable = true, -- enable highlighting
}

M.indent = {
    enable = true, -- Had some issues with regular indents with stuff like dart, thought this might help
    disable = { "python", "gdscript", }, -- these don't work
}

return M
