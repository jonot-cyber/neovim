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
		cmd = {"Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll"},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
		lazy = false,
		config = function()
			require("mason-lspconfig").setup()

			require("lspconfig").gopls.setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"neovim/nvim-lspconfig",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			require("mason-lspconfig")
			require("luasnip.loaders.from_vscode").lazy_load()
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, {"i", "s"}),
				})
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
		dependencies = {"nvim-tree/nvim-web-devicons"},
		lazy = false,
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"},
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
		dependencies = {"nvim-tree/nvim-web-devicons"},
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
	}
})

vim.cmd("colorscheme catppuccin")
