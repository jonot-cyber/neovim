local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            vim.cmd("TSUpdate")
        end,
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                }
            })
        end
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll" },
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig"
        },
        event = { "VeryLazy", "InsertEnter" },
        config = function ()
            require("config.lsp")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "neovim/nvim-lspconfig",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("config.cmp")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = {
            "NvimTreeClipboard",
            "NvimTreeClose",
            "NvimTreeCollapse",
            "NvimTreeCollapseKeepBuffers",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
            "NvimTreeFocus",
            "NvimTreeOpen",
            "NvimTreeRefresh",
            "NvimTreeResize",
            "NvimTreeToggle",
        },
        config = function()
            require("nvim-tree").setup()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "echasnovski/mini.statusline",
        config = function()
            require('mini.statusline').setup()
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = {
            "Trouble",
            "TroubleClose",
            "TroubleRefresh",
            "TroubleToggle",
        },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = {
            "ToggleTerm",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
            "ToggleTermSetName",
            "ToggleTermToggleAll",
        },
        config = function()
            require("toggleterm").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require("bufferline").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            require("lsp_signature").setup({})
        end,
    },
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        keys = { "ys", "ds", "cs" },
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        keys = {
            "<leader>dt",
            "<leader>db",
        },
        cmd = {
            "DapContinue",
            "DapLoadLaunchJSON",
            "DapRestartFrame",
            "DapSetLogLevel",
            "DapShowLog",
            "DapStepInto",
            "DapStepOut",
            "DapStepOver",
            "DapTerminate",
            "DapToggleBreakpoint",
            "DapToggleRepl",
        },
        config = function()
            require("config.dap")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
        config = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end
            })
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("dressing").setup()
        end,
    },
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("neogit").setup({})
        end,
    },
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = {
            "ChatGPT",
            "ChatGPTActAs",
            "ChatGPTEditWithInstructions",
            "ChatGPTInlineEdit",
        },
        config = function()
            require("chatgpt").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        ft = { "css", "scss", "sass" },
        config = function()
            require("colorizer").setup({
                "css";
                "scss";
            })
        end,
    },
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = true,
    },
    {
        "glepnir/lspsaga.nvim",
        lazy = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "ziontee113/syntax-tree-surfer",
        cmd = {
            "STSSelectMasterNode",
            "STSSelectCurrentNode",
            "STSSelectNextSiblingNode",
            "STSSelectPrevSiblingNode",
            "STSSelectParentNode",
            "STSSelectChildNode",
            "STSSwapNextVisual",
            "STSSwapPrevVisual",
        },
        config = function()
            require("syntax-tree-surfer")
        end,
    },
    {
        "Wansmer/treesj",
        cmd = {
            "TSJToggle",
            "TSJSplit",
            "TSJJoin",
        },
        config = function()
            require("treesj").setup()
        end,
    },

    -- themes
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
})

vim.o.expandtab = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.nu = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4
vim.g.material_style = "palenight"

vim.cmd("colorscheme catppuccin")
require("config.mapping")

-- This makes indentation work properly
-- in filetypes that are not natively
-- supported by neovim
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.dart", "*.kt"},
    callback = function(ev)
        vim.api.nvim_buf_set_option(0, "cindent", true)
    end
})
