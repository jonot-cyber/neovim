local wk = require("which-key")

wk.setup()

wk.register({
    ["<C-n>"] = {
        "<cmd>NvimTreeToggle<cr>",
        "Show nvim-tree",
    },
    ["vg"] = {
        function() require("neogit").open() end,
        "Open NeoGit",
    },
    ["<leader>a"] = {
        "<cmd>ChatGPT<cr>",
        "Ask ChatGPT",
    },
    ["<leader>dt"] = {
        function() require("dapui").toggle() end,
        "Toggle Debug UI",
    },
    ["<leader>db"] = {
        function() require("dap").toggle_breakpoint() end,
        "Toggle Breakpoint",
    },
    ["<C-s>"] = {
        "<cmd>w<cr>",
        "Save",
    },
    ["<leader>t"] = {
        "<cmd>ToggleTerm<cr>",
        "Open a Terminal",
    },
    ["<leader>p"] = {
        "<cmd>TroubleToggle<cr>",
        "View Problems",
    },
    ["<C-c>"] = {
        name = "Telescope",
        f = {
            "<cmd>Telescope find_files<cr>",
            "Find Files"
        },
        s = {
            "<cmd>Telescope live_grep<cr>",
            "Search For Something",
        },
        b = {
            "<cmd>Telescope buffers<cr>",
            "Switch to Buffer",
        },
        c = {
            "<cmd>Telescope commands<cr>",
            "Command Pallete",
        },
        d = {
            "<cmd>Telescope<cr>",
            "Default",
        },
        l = {
            name = "LSP",
            r = {
                "<cmd>Telescope lsp_references<cr>",
                "Find Refreences",
            },
            s = {
                "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                "Symbols",
            },
            i = {
                "<cmd>Telescope lsp_implementations<cr>",
                "Implementations",
            },
            d = {
                "<cmd>Telescope lsp_definitions<cr>",
                "Definitions",
            },
        }
    },
    g = {
        name = "LSP Actions",
        h = {
            "<cmd>Lspsaga lsp_finder<cr>",
            "Find symbol",
        },
        a = {
            "<cmd>Lspsaga code_action<cr>",
            "Code Action",
        },
        r = {
            "<cmd>Lspsaga rename<cr>",
            "Rename symbol",
        },
        f = {
            function() vim.lsp.buf.format() end,
            "Format Document",
        }
    },
    ["vx"] = {
        "<cmd>STSSelectMasterNode<cr>",
        "Select Master Node",
    },
    ["vn"] = {
        "<cmd>STSSelectCurrentNode<cr>",
        "Select Master Node",
    },
    ["gz"] = {
        "<cmd>TSJToggle<cr>",
        "Toggle node splits",
    }
})

vim.api.nvim_set_keymap("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', {})
vim.api.nvim_set_keymap("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', {})
vim.api.nvim_set_keymap("x", "H", '<cmd>STSSelectParentNode<cr>', {})
vim.api.nvim_set_keymap("x", "L", '<cmd>STSSelectChildNode<cr>', {})
