local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

require("mason")
mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "emmet_ls",
        "sqls",
        "pyright",
        "jdtls",
        "bashls",
        "omnisharp",
        "omnisharp_mono",
        "clangd",
        "gopls",
        "sumneko_lua",
    },
})
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
})
lspconfig["gdscript"].setup({})

require("luasnip.loaders.from_vscode").lazy_load()

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({
    enabled = function()
        local context = require("cmp.config.context")

        if vim.api.nvim_get_mode().mode == "c" then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("comment")
        end
    end,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            fallback()
        end)
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",

            before = function(entry, vim_item)
                return vim_item
            end
        })
    }
})

vim.cmd("LspStart")

require("lspsaga").init_lsp_saga({
    code_action_lightbulb = {
        virtual_text = false,
    }
})
