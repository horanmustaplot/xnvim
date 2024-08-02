return {
	"luukvbaal/statuscol.nvim",

	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			segments = {
				{
					text = { "%s" },
					-- click = "v:lua.ScSa",
					click = "v:lua.ScSa",
					maxwidth = 1,
					colwidth = 1,
					auto = true,
					wrap = true,
					fillcharhl = "SignColumn", -- highlight group used for fillchar (SignColumn/CursorLineSign if omitted)
				},
				{
					text = { builtin.foldfunc, " " },
					click = "v:lua.ScFa",
					maxwidth = 2,
					colwidth = 2,
					auto = true,
					wrap = true,
				},
				{
					text = { builtin.lnumfunc, "  " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
			},
		})
	end,
}
