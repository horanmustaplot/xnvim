return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup({})

		vim.api.nvim_create_autocmd("WinEnter", {
			callback = function()
				local floating = vim.api.nvim_win_get_config(0).relative ~= ""
				vim.diagnostic.config({
					virtual_text = floating,
					virtual_lines = not floating,
				})
			end,
		})

		-- Disable virtual_text since it's redundant due to lsp_lines.
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
