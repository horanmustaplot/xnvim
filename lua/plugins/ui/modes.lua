return {
	"mvllow/modes.nvim",
	config = function()
		require("modes").setup({
			colors = {
				normal = "#BBBBBB",
				copy = "#BBBBBB",
				delete = "#BBBBBB",
				insert = "#BBBBBB",
				visual = "#BBBBBB",
			},

			-- Set opacity for cursorline and number background
			line_opacity = 0.10,

			-- Disable modes highlights in specified filetypes
			ignore_filetypes = { "NvimTree", "TelescopePrompt", "neo-tree" },
		})
	end,
}
