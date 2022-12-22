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
		init = function()
			require("nvim-treesitter.configs").setup({})
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
		},
		config = function()
			local cmp = require("cmp")
			require("mason-lspconfig")

			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				})
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	}
})

vim.cmd("colorscheme catppuccin")
