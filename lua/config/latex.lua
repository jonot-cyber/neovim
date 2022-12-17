-- Some config for latex

-- Autocompile on save
vim.api.nvim_command("au BufWritePost *.tex !pdflatex %")
