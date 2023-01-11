local M = {}

local wk = require("which-key")

wk.register({
    ["<C-n>"] = {
        "<cmd>NvimTreeToggle<cr>",
        "Open Tree",
    },
    ["<C-s>"] = {
        "<cmd>w<cr>",
        "Save the file",
    },
    ["<leader>"] = {
        f = {
            "<cmd>Telescope find_files<cr>",
            "Find files with telescope"
        },
        c = {
            "<cmd>Telescope commands<cr>",
            "Run command with telescope"
        },
        d = {
            "<cmd>Telescope<cr>",
            "Run telescope",
        },
        t = {
            "<cmd>ToggleTerm<cr>",
            "Toggle Terminal",
        },
        g = {
            "<cmd>Neogit<cr>",
            "Open Git UI",
        },
        a = {
            "<cmd>ChatGPT<cr>",
            "Ask chatgpt something",
        },
        s = {
            "<cmd>HopAnywhere<cr>",
            "Find something in a file",
        },
    },
    ["<space>"] = {
        e = {
            function() vim.diagnostic.open_float() end,
            "Open diagnostics float",
        },
        ["rn"] = {
            function() vim.lsp.buf.rename() end,
            "Rename",
        },
        ["ca"] = {
            function() vim.lsp.buf.code_action() end,
            "Code Action",
        },
        f = {
            function() vim.lsp.buf.format({async = true}) end,
            "Format",
        },
    },
    ["[d"] = {
        function() vim.diagnostic.goto_prev() end,
        "Go to next diagnostic",
    },
    ["]d"] = {
        function() vim.diagnostic.goto_next() end,
        "Go to previous diagnostic",
    },
    g = {
        D = {
            function() vim.lsp.buf.declaration() end,
            "Go to declaration",
        },
        d = {
            function() vim.lsp.buf.definition() end,
            "Go to definition",
        },
        i = {
            function() vim.lsp.buf.implementation() end,
            "Go to implementation",
        },
    },
    K = {
        function() vim.lsp.buf.hover() end,
        "Lsp hover",
    },
})

return M
