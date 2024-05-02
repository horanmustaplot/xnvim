return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths

		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets

		"onsails/lspkind.nvim", -- vs-code like pictograms

		"zbirenbaum/copilot-cmp", -- vs-code like pictograms
	},
	config = require("horan.plugins.cmp.configs.nvim-cmp"),
}
