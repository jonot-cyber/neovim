local lspconfig = require 'lspconfig'

lspconfig.cssls.setup {}
-- lspconfig.emmet_ls.setup {}
lspconfig.html.setup {}
lspconfig.pyright.setup {}
lspconfig.gopls.setup {}
lspconfig.tsserver.setup {}
lspconfig.clangd.setup {}
lspconfig.angularls.setup {}
lspconfig.omnisharp.setup {
    cmd = { 'dotnet', '/home/jonot/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll'}
}
lspconfig.jdtls.setup {}
lspconfig.texlab.setup {}
-- lspconfig.rust_analyzer.setup {}

require 'lsp_signature'.setup {}

--[[local opts = {
	noremap = true,
	silent = true,
}]]--

-- require 'config.lsphandlers'
