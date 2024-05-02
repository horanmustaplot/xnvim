return {
	"mfussenegger/nvim-dap",
	enabled = vim.fn.has("win32") == 0,
	dependencies = {
		{
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio",
			dependencies = { "nvim-dap" },
			cmd = { "DapInstall", "DapUninstall" },
			opts = { handlers = {} },
		},

		{
			"rcarriga/nvim-dap-ui",
			opts = { floating = { border = "rounded" } },
			config = function()
				local dap, dapui = require("dap"), require("dapui")

				dap.listeners.after.event_initialized["dapui_config"] = function()
					vim.cmd([[Neotree close]])
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function() --[[dapui.close()]]
				end
				dap.listeners.before.event_exited["dapui_config"] = function() --[[dapui.close()]]
				end
				dapui.setup({ floating = { border = "rounded" } })
			end,
		},

		{
			"rcarriga/cmp-dap",
			dependencies = { "nvim-cmp" },
			config = function()
				require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
					sources = {
						{ name = "dap" },
					},
				})
			end,
		},
	},

	config = function()
		-- configuring break point.
		vim.api.nvim_set_hl(0, "magenta", { fg = "#4E2537" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "●", texthl = "magenta", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		-- For C/C++.
		---------------------------------------------------------------------------------------
		local dap = require("dap")
		dap.adapters.cpp = {
			type = "executable",
			command = "lldb-vscode",
			env = {
				LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
			},
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "cpp",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				args = {},
			},
		}
		dap.configurations.c = dap.configurations.cpp
		---------------------------------------------------------------------------------------
	end,
}
