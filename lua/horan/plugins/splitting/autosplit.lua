return {
	"yochem/autosplit.nvim",
	config = function()
		require("autosplit").setup({
			split = "auto", -- choose one of 'auto', 'horizontal' and 'vertical'
			min_win_width = 80, -- the minimal width you want for a splitted window
		})
	end,
}
