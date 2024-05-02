return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
	version = "v7.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

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
							notes = "~/notes/sys",
						},

						default_workspace = "notes",
					},
				},
			},
		})
	end,
}
