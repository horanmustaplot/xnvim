return {
	"mvllow/modes.nvim",
	config = function()
		require("modes").setup({
			colors = {
				normal = "#cccccc",
				copy = "#82cfff",
				delete = "#B4333A",
				insert = "#BBBBBB",
				visual = "#FBFC94",
			},

			-- Set opacity for cursorline and number background
			line_opacity = 0.15,

			-- Disable modes highlights in specified filetypes
			ignore_filetypes = { "NvimTree", "TelescopePrompt", "neo-tree" },
		})
	end,
}
