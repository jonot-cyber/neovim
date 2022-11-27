return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-tree/nvim-tree.lua'
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
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
    use 'akinsho/toggleterm.nvim'

	-- Themes
	use 'rafamadriz/neon'
    use 'folke/tokyonight.nvim'
end)
