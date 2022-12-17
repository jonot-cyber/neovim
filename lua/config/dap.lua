local dap = require "dap"
local dap_ui = require "dapui"

dap_ui.setup()

dap.adapters.go = {
    type = "executable";
    command = "node";
    args = {os.getenv("HOME") .. "/Programs/vscode-go/dist/debugAdapter.js"}
}

dap.adapters.godot = {
    type = "server",
    host = "127.0.0.1",
    port = 6006,
}

dap.configurations.go = {
    {
        type = "go";
        name = "Debug";
        request = "launch";
        showLog = false;
        program = "${file}";
        dlvToolPath = vim.fn.exepath("dlv")
    }
}
