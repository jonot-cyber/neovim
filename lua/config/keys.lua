local opt = {
	noremap = true,
	silent = true,
}

vim.cmd [[nnoremap <Leader>b :lua require('telescope.builtin').buffers()<CR>]]
vim.cmd [[nnoremap <C-n> :NvimTreeToggle<CR>]]
vim.cmd [[nnoremap <Leader>f :lua require 'telescope.builtin'.find_files()<CR>]]
vim.cmd [[nnoremap <Leader>t :ToggleTerm<CR>]]
vim.cmd [[nnoremap <C-s> :w<CR>]]
