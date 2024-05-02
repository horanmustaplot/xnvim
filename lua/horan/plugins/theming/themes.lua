return {
	{ -- Gruvbox material
		"sainnhe/gruvbox-material",
	},
	-- Horizon
	{
		"akinsho/horizon.nvim",
		version = "*",
	},
	{ -- Oxocarbon theme{Current theme}
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd("colorscheme oxocarbon")
		end,
	},
}
