local cmp = require 'cmp'
local lspkind = require 'lspkind'

local luasnip = require 'luasnip'

cmp.setup {
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"})
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
}

require 'nvim-lightbulb'.setup {
	autocmd = {
		enabled = true
	}
}
