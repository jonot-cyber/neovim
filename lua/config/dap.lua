local dap = require("dap")
require("mason").setup()
require("mason-nvim-dap").setup({
    automatic_setup = true,
})
require("mason-nvim-dap").setup_handlers()

require("dapui").setup({})

