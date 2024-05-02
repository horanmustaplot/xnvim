return {
	"ofirgall/goto-breakpoints.nvim",
	config = function()
		local map = vim.keymap.set
		map("n", "]d", require("goto-breakpoints").next, {})
		map("n", "[d", require("goto-breakpoints").prev, {})
		map("n", "]S", require("goto-breakpoints").stopped, {})
	end,
}
