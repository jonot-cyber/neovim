local opt = {
	noremap = true,
	silent = true,
}

local keybinds = {
    ["<Leader>b"] = ":lua require('telescope.builtin').buffers()<CR>",
    ["<Leader>f"] = ":lua require('telescope.builtin').find_files()<CR>",
    ["<Leader>th"] = ":lua require('telescope.builtin').colorscheme()<CR>",

    ["<Leader>te"] = ":ToggleTerm<CR>",
    ["<C-n>"] = ":NvimTreeToggle<CR>",
    ["<C-s>"] = ":w<CR>",
}

-- vim.cmd [[nnoremap <Leader>b :lua require('telescope.builtin').buffers()<CR>]]
-- vim.cmd [[nnoremap <C-n> :NvimTreeToggle<CR>]]
-- vim.cmd [[nnoremap <Leader>f :lua require 'telescope.builtin'.find_files()<CR>]]
-- vim.cmd [[nnoremap <Leader>t :ToggleTerm<CR>]]
-- vim.cmd [[nnoremap <C-s> :w<CR>]] ]--

for key, val in pairs(keybinds) do
    vim.api.nvim_set_keymap("n", key, val, {})
end
