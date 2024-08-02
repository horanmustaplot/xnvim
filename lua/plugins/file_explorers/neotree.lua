return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local directory = {
			{ "indent" },
			{ "icon" },
			{ "current_filter" },
			{
				"container",
				width = "100%",
				content = {
					{ "name", zindex = 40 },
					{ "diagnostics", zindex = 30 },
					{ "clipboard", zindex = 20 },
					{ "git_status", zindex = 10, align = "right" },
				},
			},
		}
		local file = {
			{ "indent" },
			{ "icon" },
			{
				"container",
				width = "100%",
				content = {
					{
						"name",
						use_git_status_colors = true,
						zindex = 100,
					},
					{ "modified", zindex = 50 },
					{ "diagnostics", zindex = 40 },
					{ "bufnr", zindex = 30 },
					{ "clipboard", zindex = 20 },
					{ "git_status", zindex = 10, align = "right" },
				},
			},
		}

		vim.keymap.set("n", "-", function()
			local reveal_file = vim.fn.expand("%:p")
			if reveal_file == "" then
				reveal_file = vim.fn.getcwd()
			else
				local f = io.open(reveal_file, "r")
				if f then
					f.close(f)
				else
					reveal_file = vim.fn.getcwd()
				end
			end
			require("neo-tree.command").execute({
				action = "focus", -- OPTIONAL, this is the default value
				source = "filesystem", -- OPTIONAL, this is the default value
				position = "left", -- OPTIONAL, this is the default value
				reveal_file = reveal_file, -- path to file or folder to reveal
				reveal_force_cwd = true, -- change cwd without asking if needed
			})
		end, { desc = "Open neo-tree at current file or working directory" })

		-- Define custom highlight groups for folder icons

		--[[ vim.api.nvim_set_hl(0, "NeoTreeFolderIcon", { fg = "#ff79c6", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#bd93f9", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#50fa7b", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#CCCCCC", bg = "NONE" }) ]]

		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#AEAEAE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#AEAEAE", bg = "NONE" })

		require("neo-tree").setup({

			add_blank_line_at_top = true, -- Add a blank line at the top of the tree.
			auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			-- popup_border_style is for input and confirmation dialogs.
			-- Configurtaion of floating window is done in the individual source sections.
			-- "NC" is a special style that works well with NormalNC set
			default_source = "filesystem",
			enable_diagnostics = true,
			enable_git_status = true,
			enable_modified_markers = true, -- Show markers for files with unsaved changes.
			enable_opened_markers = true, -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
			enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
			enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.

			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			default_component_configs = {

				diagnostics = {
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = "󰌵 ",
					},
					highlights = {
						hint = "DiagnosticSignHint",
						info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError",
					},
				},
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					-- expander config, needed for nesting files
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = "", -- nf-custom-folder \ue5ff
					folder_open = "", -- nf-custom-folder_open \ue5fe
					folder_empty = "", -- nf-cod-folder \uea83
					folder_empty_open = "", -- nf-cod-folder_opened \ueaf7
					default = "", -- : nf-fa-file_text_o \uf0f6, : nf-fa-file_o \uf016
				},
				modified = {
					symbol = "",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "left",
				width = 25,
				auto_expand_width = false,
			},

			filesystem = {
				use_libuv_file_watcher = true, -- Automatically refresh
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},

			--[[ filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				use_libuv_file_watcher = true, -- Enable automatic reloading on file system changes
			}, ]]
		})
	end,
}
