-- Bootstrap lazy if it is not present
--[[
-- This file is for lazy.nvim, and manages all of the packages that I have installed.
--]]

-- Ensure that lazy.nvim is installed
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

-- Setup lazy
require("lazy").setup({
    { -- An incremental parsing system for programming tools
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = function()
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup(require("config.plugins.treesitter"))
        end,
    },
    { -- A file explorer tree for neovim written in lua
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup(require("config.plugins.nvim-tree"))
        end,
    },
    "williamboman/mason.nvim", -- Portable package manager for Neovim that runs everywhere Neovim runs.
    { -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    { -- A completion plugin for neovim coded in Lua.
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
    { -- Create key bindings that stick.
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.plugins.which-key")
        end,
    },
    { -- Find, Filter, Preview, Pick. All lua, all the time.
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup()
        end,
    },
    { -- A blazingly fast and easy to configure neovim statusline plugin written in pure lua.
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({})
        end,
    },
    { -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("trouble").setup({})
        end,
    },
    { -- A neovim lua plugin to help easily manage multiple terminal windows
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
            require("toggleterm").setup()
        end,
    },
    { -- A snazzy bufferline for Neovim
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("bufferline").setup()
        end,
    },
    { -- Smart and powerful comment plugin for neovim
        "numToStr/Comment.nvim",
        keys = {"g"},
        event = "InsertEnter",
        config = function()
            require("Comment").setup()
        end,
    },
    { -- Add/change/delete surrounding delimiter pairs with ease
        "kylechui/nvim-surround",
        keys = {"ys", "ds", "cs"},
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    { -- magit for neovim
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("neogit").setup({})
        end,
    },
    { -- Neovim plugin for interacting with OpenAI GPT-3 chatbot
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
    { -- Neovim motions on speed!
        "phaazon/hop.nvim",
        cmd = "HopAnywhere",
        config = function()
            require("hop").setup()
        end,
    },
    { -- Highly experimental plugin that completely replaces the UI for messages, cmdline, and the popupmenu
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
    { -- autopairs for neovim written by lua
        "windwp/nvim-autopairs",
        event = {"InsertEnter"},
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    { -- Not UFO in the sky, but an ultra fold in Neovim
        "kevinhwang91/nvim-ufo",
        dependencies = {"kevinhwang91/promise-async"},
        config = function()
            require("config.plugins.ufo")
        end,
    },
    { -- Show code context
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        event = "VeryLazy",
        config = function()
            require("treesitter-context").setup(require("config.plugins.treesitter-context"))
        end,
    },
    "gpanders/nvim-parinfer", -- parinfer for Neovim
    { -- Indent guides for Neovim
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
    "folke/tokyonight.nvim", -- This is the theme I use now
    "navarasu/onedark.nvim",
})

require("config.plugins.mason") -- I gave up on lazily-loading this one
