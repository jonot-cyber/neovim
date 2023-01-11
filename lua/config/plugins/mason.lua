local M = {}

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "gopls", },
})

mason_lspconfig.setup_handlers({
    function (server_name)
        lspconfig[server_name].setup({})
    end,
})

return M
