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
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			require("mason-lspconfig")
			require("luasnip.loaders.from_vscode").lazy_load()
			local lspkind = require("lspkind")
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
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",

						before = function(entry, vim_item)
							return vim_item
						end
					})
				}
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
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		keys = {"ys", "ds", "cs"},
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap"},
		init = function()
			local dap = require("dap")

			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = {"dap", "-l", "127.0.0.1:${port}"}
				}
			}

			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug test",
					request = "launch",
					mode = "test",
					program = "${file}"
				},
				{
					type = "delve",
					name = "Debug test (go.mod)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}"
				},
			}
			require("dapui").setup({})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {"kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter"},
		event = "VeryLazy",
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return {"treesitter", "indent"}
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
    }
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

vim.cmd("colorscheme catppuccin")
