local M = {}

require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {"treesitter", "indent"}
    end
})

return M
