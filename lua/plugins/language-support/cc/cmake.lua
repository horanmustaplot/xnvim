return {
	{
		"Shatur/neovim-cmake",
		config = function()
			require("cmake").setup({

				quickfix = {
					pos = "botright", -- Where to open quickfix
					height = 10, -- Height of the opened quickfix.
					only_on_error = true, -- Open quickfix window only if target build failed.
				},

				dap_open_command = false,

				dap_configuration = {
					type = "gdb",
					request = "launch",
					stopOnEntry = false,
					runInTerminal = false,
				},
			})
		end,
	},
}
