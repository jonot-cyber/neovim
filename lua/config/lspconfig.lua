local lspconfig = require 'lspconfig'

lspconfig.cssls.setup {}
lspconfig.emmet_ls.setup {}
lspconfig.html.setup {}
lspconfig.jedi_language_server.setup {}
lspconfig.gopls.setup {}
lspconfig.tsserver.setup {}
lspconfig.clangd.setup {}
lspconfig.omnisharp.setup {
    cmd = { "dotnet", "/home/jonot/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll"}
}
-- lspconfig.rust_analyzer.setup {}

require 'lsp_signature'.setup {}

local opts = {
	noremap = true,
	silent = true,
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>c', vim.lsp.buf.code_action, opts)

require 'config.lsphandlers'
