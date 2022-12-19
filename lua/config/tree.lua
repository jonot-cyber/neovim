require 'nvim-web-devicons'.setup()
local nvim_tree = require("nvim-tree")
nvim_tree.setup()

vim.api.nvim_create_autocmd('BufEnter', {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
        end
    end
})
