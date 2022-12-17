local opt = {
	noremap = true,
	silent = true,
}

local keybinds = {
    ["<M-t>b"]  = ":lua require('telescope.builtin').buffers()<CR>",
    ["<M-t>f"]  = ":lua require('telescope.builtin').find_files()<CR>",
    ["<M-t>t"] = ":lua require('telescope.builtin').colorscheme()<CR>",
    ["<C-c>"] = ":Telescope<CR>",

    ["<M-l>e"] = ":lua vim.diagnostic.open_float()<CR>",
    ["<M-l>c"] = ":lua vim.lsp.buf.code_action()<CR>",
    ["<M-l>r"] = ":lua vim.lsp.buf.rename()<CR>",

    ["<leader>t"] = ":ToggleTerm<CR>",
    ["<leader>g"] = ":Neogit<CR>",
    ["<C-n>"] = ":NvimTreeToggle<CR>",
    ["<C-s>"] = ":w<CR>",

}

for key, val in pairs(keybinds) do
    vim.api.nvim_set_keymap("n", key, val, {})
end
