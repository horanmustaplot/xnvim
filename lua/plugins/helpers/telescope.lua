return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",

		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-project.nvim",
		"debugloop/telescope-undo.nvim",

		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"LukasPietzschmann/telescope-tabs",
		"jvgrootveld/telescope-zoxide",
		"dawsers/telescope-file-history.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				set_env = { COLORTERM = "truecolor" },
				dynamic_preview_title = true,
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.8,
					preview_cutoff = 120,
				},
			},
			pickers = {
				oldfiles = {
					prompt_title = "Recent files",
				},
			},
		})

		telescope.load_extension("fzf")

		-- Load telescope project
		require("telescope").load_extension("project")
		require("telescope").load_extension("undo")

		-- These are the default values
		require("file_history").setup({
			-- This is the location where it will create your file history repository
			backup_dir = "~/.file-history-git",
			-- command line to execute git
			git_cmd = "git",
		})
		require("telescope").load_extension("file_history")

		vim.keymap.set(
			"n",
			"<leader>fl",
			require("telescope").extensions.flutter.commands,
			{ desc = "Open command Flutter" }
		)
	end,
}
