return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{
		"nvim-neorg/neorg",
		version = "*",
		dependencies = { "luarocks.nvim" },
		-- put any other flags you wanted to pass to lazy here!
		config = function()
			require("neorg").setup({
				neorg_leader = "<space>",
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.keybinds"] = {
						config = {
							neorg_leader = "<space>",
						},
					},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "/home/x_user/org/my_mind",
							},

							default_workspace = "notes",
						},
					},
				},
			})
		end,
	},
}
