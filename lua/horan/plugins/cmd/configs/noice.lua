return function()
	require("noice").setup({
		health = {
			checker = false,
		},
		cmdline = {
			view = "cmdline",
			format = {
				cmdline = {
					pattern = "^:",
					icon = " ",
					lang = "vim",
				},
				search_down = {
					kind = "search",
					pattern = "^/",
					icon = " ",
					lang = "regex",
				},
				search_up = {
					kind = "search",
					pattern = "^%?",
					icon = " ",
					lang = "regex",
				},
				filter = {
					pattern = "^:%s*!",
					icon = "$",
					lang = "bash",
				},
				lua = {
					pattern = "^:%s*lua%s+",
					icon = "",
					lang = "lua",
				},
				help = {
					pattern = "^:%s*h%s+",
					icon = "",
				},
				input = {},
			},
		},
	})
end
