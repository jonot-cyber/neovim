--[[
-- Mason is a plugin that allows for automatic installation of things like lsp servers
-- Configured along with lspconfig to simplify loading
--]]
local M = {}

local mason = require("mason") -- Easier way to install lsp servers
local mason_lspconfig = require("mason-lspconfig") -- Interactions between mason and lspconfig
local lspconfig = require("lspconfig") -- Configuring language servers

mason.setup() -- Setup mason
mason_lspconfig.setup({ -- Setup mason lspconfig
    ensure_installed = { "gopls", }, -- Automatically install gopls if it isn't already
})

mason_lspconfig.setup_handlers({ -- Automatically create handlers for installed language servers
    function (server_name) -- Generic setup
        lspconfig[server_name].setup({})
    end,

    ["sumneko_lua"] = function() -- Special setup for lua since it has some extra features
        local runtime_path = vim.split(package.path, ";") -- Set the runtime path
        table.insert(runtime_path, "lua/?.lua") -- Add all of the lua folders
        table.insert(runtime_path, "lua/?/init.lua")

        lspconfig.sumneko_lua.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Tell lsp about the vim global
                    },
                    workspace = {
                        library = {
                            vim.api.nvim_get_runtime_file("", true), -- Tell lsp to use vim runtimes
                            vim.fn.stdpath("data") .. "/lazy" -- Path for packages
                        },
                    },
                },
            },
        })
    end,
})

lspconfig.zls.setup{}

return M
