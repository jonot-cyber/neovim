-- Bootstrap lazy if it is not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "cone",
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
        event = "VeryLazy",
        build = function()
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup(require("config.plugins.treesitter"))
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup(require("config.plugins.nvim-tree"))
        end,
    },
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig",
            "L3MON4D3/LuaSnip",
            "williamboman/mason-lspconfig.nvim",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("config.plugins.cmp")
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.plugins.which-key")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({})
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
            require("toggleterm").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("bufferline").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        keys = {"g"},
        event = "InsertEnter",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        keys = {"ys", "ds", "cs"},
        config = function()
            require("nvim-surround").setup({})
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
        cmd = "ChatGPT",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("chatgpt").setup()
        end,
    },
    {
        "phaazon/hop.nvim",
        cmd = "HopAnywhere",
        config = function()
            require("hop").setup()
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({})
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = {"InsertEnter"},
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {"kevinhwang91/promise-async"},
        config = function()
            require("config.plugins.ufo")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        event = "VeryLazy",
        config = function()
            require("treesitter-context").setup(require("config.plugins.treesitter-context"))
        end,
    },
    "gpanders/nvim-parinfer",
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup(require("config.plugins.indent-blankline"))
        end,
    },

    -- themes
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    "folke/tokyonight.nvim",
    "navarasu/onedark.nvim",
})

require("config.plugins.mason")
