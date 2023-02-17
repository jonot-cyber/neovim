--[[
-- ufo uses treesitter to make code-folding work better
--]]
local M = {}

require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {"treesitter", "indent"} -- use treesitter
    end
})

return M
