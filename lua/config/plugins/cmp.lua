--[[
-- cmp is a plugin that provides completion for neovim with various sources. This file contains the configurations for it
--]]
local M = {}

local cmp_autopairs = require("nvim-autopairs.completion.cmp") -- Adds parenthesis after a function is completed
local cmp = require("cmp") -- Plugin that provides completion
local lspkind = require("lspkind") -- Adds vscode-esque symbols to cmp

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Apparently a snippet plugin is needed. I don't use this
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- Requests a completion at a point
        ["<C-e>"] = cmp.mapping.abort(), -- Closes completion
        ["<CR>"] = cmp.mapping.confirm({ select = false, }), -- Confirms completion
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Gets completions from language server protocol
        { name = "luasnip" }, -- Get completions from snippets
    }, {}),
    formatting = {
        format = lspkind.cmp_format({ -- Format with lspkind
            mode = "symbol",
        }),
    },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) -- allow cmp_autopairs to handle confirm done (see above)

return M
