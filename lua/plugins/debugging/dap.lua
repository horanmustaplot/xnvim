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
			-- opts = { floating = { border = "rounded" } },
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
		-- Breakpoint.

		vim.api.nvim_set_hl(0, "BreakPointColor", { fg = "#3ddbd9" })
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "●", texthl = "BreakPointColor", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		-- C & C++.

		local dap = require("dap")

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode",
			name = "lldb",
		}

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-q", "-i", "dap" },
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
