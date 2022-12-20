return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
        'neovim/nvim-lspconfig',
        config = function()
            -- require("config.lspconfig")
        end
    }
	use {
        'hrsh7th/nvim-cmp',
        config = function()
            require("config.cmp")
        end
    }
	use 'hrsh7th/cmp-nvim-lsp'
	use 'nvim-treesitter/nvim-treesitter'
	use {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function()
            require("config.tree")
        end
    }
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'kosayoda/nvim-lightbulb'
	use 'antoinemadec/FixCursorHold.nvim'
	use 'williamboman/mason.nvim'
	use 'onsails/lspkind.nvim'
	use 'windwp/nvim-autopairs'
	use 'ray-x/lsp_signature.nvim'
	use 'RishabhRD/popfix'
	use 'RishabhRD/nvim-lsputils'
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        cmd = "Neogit",
        config = function()
            require("neogit").setup()
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        cmd = "ToggleTerm",
        config = function()
            require("config.toggleterm")
        end
    }
    use 'f-person/git-blame.nvim'
    use {
        'ray-x/go.nvim',
        ft = {"go"},
        config = function()
            require("go").setup()
        end
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = 'mfussenegger/nvim-dap',
        config = function()
            require("dapui")
            require("config.dap")
        end
    }
    use 'kylechui/nvim-surround'
    use 'eraserhd/parinfer-rust'
    use {
        'L3MON4D3/LuaSnip',
        config = function()
            require("config.snippets")
        end
    }
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = function()
            require("config/fold")
        end
    }
    -- Packer
    use {
        "jackMort/ChatGPT.nvim",
        cmd = "ChatGPT",
        config = function()
            require("chatgpt").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }

	-- Themes
	use 'rafamadriz/neon'
    use 'indika-dev/eclipse.nvim'
    use {
        'folke/tokyonight.nvim',
        config = function()
            require("config.theme")
        end
    }
    use 'sainnhe/gruvbox-material'
    use 'shaunsingh/nord.nvim'
    use 'sainnhe/edge'
    use 'Mofiqul/vscode.nvim'
    use 'doums/darcula'
    use 'mhartington/oceanic-next'
    use 'rose-pine/neovim'
    use 'joshdick/onedark.vim'
    use 'tanvirtin/monokai.nvim'
    use 'projekt0n/github-nvim-theme'
    use 'Shatur/neovim-ayu'
    use 'catppuccin/nvim'

end)
