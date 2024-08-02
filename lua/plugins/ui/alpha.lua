return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local sections = {
			header = {
				type = "text",
				val = {
					"░░   ░░ ░░░░░░░ ░░      ░░       ░░░░░░      ░░     ░░  ░░░░░░  ░░░░░░  ░░      ░░░░░░  ░░ ░░",
					"▒▒   ▒▒ ▒▒      ▒▒      ▒▒      ▒▒    ▒▒     ▒▒     ▒▒ ▒▒    ▒▒ ▒▒   ▒▒ ▒▒      ▒▒   ▒▒ ▒▒ ▒▒",
					"▒▒▒▒▒▒▒ ▒▒▒▒▒   ▒▒      ▒▒      ▒▒    ▒▒     ▒▒  ▒  ▒▒ ▒▒    ▒▒ ▒▒▒▒▒▒  ▒▒      ▒▒   ▒▒ ▒▒ ▒▒",
					"▓▓   ▓▓ ▓▓      ▓▓      ▓▓      ▓▓    ▓▓     ▓▓ ▓▓▓ ▓▓ ▓▓    ▓▓ ▓▓   ▓▓ ▓▓      ▓▓   ▓▓      ",
					"██   ██ ███████ ███████ ███████  ██████       ███ ███   ██████  ██   ██ ███████ ██████  ██ ██",
				},
				opts = {
					position = "center",
					hl = "Decorator",
				},
			},
			buttons = {
				type = "group",
				val = {
					dashboard.button(
						"SPC l s",
						"  Restore last session",
						[[<cmd>lua require("persistence").load({ last = true })<cr>]]
					),
					dashboard.button("SPC e f", "  New File", "<cmd>ene<CR>"),
					dashboard.button("SPC o A", "  Open agenda", ":Telescope oldfiles<CR>"),
					dashboard.button("SPC e e", "  Toggle file explorer", ":Neotree<CR>"),
					dashboard.button("SPC p p", "  Open project", ":Telescope project<CR>"),
					dashboard.button("SPC RET", "  Jump to bookmark", ":Telescope marks<CR>"),
					dashboard.button("SPC c", "  Configurations", ":cd ~/.config/nvim | Telescope find_files<CR>"),
					dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
				},
				opts = {
					spacing = 1,
				},
			},
			footer = {
				type = "text",
				val = "𝓱𝓸𝓻𝓪𝓷𝓿𝓲𝓶",
				opts = {
					position = "center",
					hl = "helpSpecial",
				},
			},
			icon = {
				type = "button",
				val = "",
				opts = {
					position = "center",
					hl = "Decorator",
				},
				on_press = function()
					os.execute("xdg-open https://github.com/horanmustaplot/horanvim")
				end,
			},
		}

		-- Send config to alpha
		alpha.setup({
			layout = {
				{
					type = "padding",
					val = 4,
				},
				sections.header,
				{
					type = "padding",
					val = 2,
				},
				sections.buttons,
				{
					type = "padding",
					val = 2,
				},
				sections.footer,
				{
					type = "padding",
					val = 1,
				},
				sections.icon,
			},
		})
	end,
}
