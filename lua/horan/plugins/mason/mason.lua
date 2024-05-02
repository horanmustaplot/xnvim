return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason") -- import mason
		local mason_lspconfig = require("mason-lspconfig") -- import mason-lspconfig
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- ==> Installing language servers here.
		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- LSPs
				"clangd", -- C++
				"lua_ls", -- Lua
				"neocmake", -- CMake
				"autotools_ls", -- Make, autoconf ...
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
			},
		})
	end,
}
