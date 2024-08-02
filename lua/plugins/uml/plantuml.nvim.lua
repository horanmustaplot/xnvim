return {
	"https://gitlab.com/itaranto/plantuml.nvim",
	version = "*",
	opts = {
		renderer = {
			type = "image",
			options = {
				prog = "feh",
				dark_mode = false,
				format = nil, -- Allowed values: nil, 'png', 'svg'.
			},
		},
		render_on_write = true,
	},
}
