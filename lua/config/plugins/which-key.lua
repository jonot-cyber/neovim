local M = {}

local wk = require("which-key")

wk.register({
    ["<C-n>"] = {
        function ()
            local api = require("nvim-tree.api")
            api.tree.toggle()
        end,
        "Open Tree",
    },
    ["<C-s>"] = {
        "<cmd>w<cr>",
        "Save the file",
    },
    ["<leader>"] = {
        f = {
            function ()
                local builtin = require("telescope.builtin")
                builtin.find_files()
            end,
            "Find files with telescope"
        },
        c = {
            function()
                local builtin = require("telescope.builtin")
                builtin.commands()
            end,
            "Run command with telescope"
        },
        d = {
            "<cmd>Telescope<cr>",
            "Run telescope",
        },
        t = {
            function()
                local Terminal = require("toggleterm.terminal").Terminal
                Terminal:new():toggle()
            end,
            "Toggle Terminal",
        },
        g = {
            function()
                local neogit = require("neogit")
                neogit.open({})
            end,
            "Open Git UI",
        },
        a = {
            function()
                local chatgpt = require("chatgpt")
                chatgpt.openChat()
            end,
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
        ["<space>"] = {
            "<cmd>Telescope<CR>",
            "Quick open things",
        }
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

wk.setup({
    window = {
        border = "single",
    },
})

return M
