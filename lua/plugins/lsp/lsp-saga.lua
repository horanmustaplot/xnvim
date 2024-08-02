-- lsp-saga provides a lot of stuff such as outliner, ...

return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("lspsaga").setup({
			win_width = 25,
			auto_close = false,
			symbol_in_winbar = {
				enable = false, -- true, if wanna see winbar symbols
				separator = " › ",
			},
			ui = {
				code_action = "", --  
			},
			outline = {
				win_width = 25,
				keys = {
					jump = "<CR>",
				},
			},
		})
	end,
}
