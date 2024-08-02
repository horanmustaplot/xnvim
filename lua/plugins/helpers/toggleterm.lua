return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				-- size can be a number or function which is passed the current terminal
				size = function(term)
					if term.direction == "horizontal" then
						return 12
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				direction = "vertical",
				auto_scroll = true, -- automatically scroll to the bottom on terminal output
			})
		end,
	},
}
