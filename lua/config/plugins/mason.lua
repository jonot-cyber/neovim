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

    ["sumneko_lua"] = function()
        local runtime_path = vim.split(package.path, ";")
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        lspconfig.sumneko_lua.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })
    end,
})

return M
