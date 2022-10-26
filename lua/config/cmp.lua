local cmp = require('cmp')
local lspkind = require 'lspkind'

cmp.setup {
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
	},
	formatting = {
		format = lspkind.cmp_format {}
	}
}

require('nvim-lightbulb').setup {
	autocmd = {
		enabled = true
	}
}
