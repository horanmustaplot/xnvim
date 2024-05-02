if vim.g.neovide then
	-- Disable color column for other filetypes
	vim.cmd("autocmd FileType * set colorcolumn=")

	-- Enable color column 80 specific files, C and CPP ones
	vim.cmd("autocmd FileType cpp set colorcolumn=80")
	vim.cmd("autocmd FileType c set colorcolumn=80")
end
