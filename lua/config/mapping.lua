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
            function() require("telescope.builtin").find_files() end,
            "Find Files"
        },
        s = {
            function() require("telescope.builtin").live_grep() end,
            "Search For Something",
        },
        b = {
            function() require("telescope.builtin").buffers() end,
            "Switch to Buffer",
        },
        c = {
            function() require("telescope.builtin").commands() end,
            "Command Pallete",
        },
        l = {
            name = "LSP",
            r = {
                function() require("telescope.builtin").lsp_references() end,
                "Find Refreences",
            },
            s = {
                function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
                "Symbols",
            },
            i = {
                function() require("telescope.builtin").lsp_implementations() end,
                "Implementations",
            },
            d = {
                function() require("telescope.builtin").lsp_definitions() end,
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
