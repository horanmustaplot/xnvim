return {
	"sainnhe/gruvbox-material",
	"nyoom-engineering/oxocarbon.nvim",
	"akinsho/horizon.nvim",
	"folke/tokyonight.nvim",
	"rose-pine/neovim",
	"catppuccin/nvim",
	"EdenEast/nightfox.nvim",
	"olimorris/onedarkpro.nvim",
	{
		"horanmustaplot/xcarbon.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd("colorscheme xcarbon")
		end,
	},
}
