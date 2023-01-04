local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

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
    }
})

mason_lspconfig.setup_handlers({
    function (server_name)
        lspconfig[server_name].setup({})
    end,
})
lspconfig["gdscript"].setup({})

vim.cmd("LspStart")
