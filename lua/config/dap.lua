local dap = require("dap")
require("mason").setup()
require("mason-nvim-dap").setup({
    automatic_setup = true,
})
require("mason-nvim-dap").setup_handlers()

dap.configurations.cs = {
    {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "${workspaceFolder}",
        launch_scene = true,
    }
}

dap.adapters.godot = {
    type = "server",
    host = "127.0.0.1",
    port = 6007,
}

require("dapui").setup({})
